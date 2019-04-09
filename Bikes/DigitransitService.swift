//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import Foundation

/// https://digitransit.fi/en/

class DigitransitService {
    private let urlSession: URLSession

    init() {
        let bundleID = Bundle.main.bundleIdentifier ?? "bikes"
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "0.0"
        let userAgent = "\(bundleID) \(version)"

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["User-Agent": userAgent]

        urlSession = URLSession(configuration: configuration)
    }

    /// Interactive API playground at
    /*
    https://api.digitransit.fi/graphiql/hsl?query=%7B%0A%20%20bikeRentalStations%20%7B%0A%20%20%20%20name%0A%20%20%20%20bikesAvailable%0A%20%20%20%20realtime%0A%20%20%20%20lat%0A%20%20%20%20lon%0A%20%20%7D%0A%7D
     */

    struct BikeRentalStation: Decodable {
        /// Name of the bike rental station
        var name: String?
        /// Number of bikes currently available on the rental station.
        var bikesAvailable: Int?
        /// If true, values of bikesAvailable and spacesAvailable are
        /// updated from a real-time source. If false, values of bikesAvailable
        /// and spacesAvailable are always the total capacity divided by two.
        var realtime: Bool?
        /// Longitude of the bike rental station (WGS 84)
        var lon: Float?
        /// Latitude of the bike rental station (WGS 84)
        var lat: Float?
    }

    struct BikeRentalStationsResponse: Decodable {
        var data: BikeRentalStationsResponseData?
    }

    struct BikeRentalStationsResponseData: Decodable {
        var bikeRentalStations: [BikeRentalStation]?
    }

    func getBikeRentalStations(completion: @escaping (BikeRentalStationsResponse?, Error?) -> Void) {
        /// This is a really wonderful API!
        ///
        /// And it has great docs too:
        /// https://digitransit.fi/en/developers/apis/1-routing-api/bicycling/
        ///
        /// Thank you! 🇫🇮💪🏼

        guard let url = URL(string: "https://api.digitransit.fi/routing/v1/routers/hsl/index/graphql") else {
            completion(nil, nil)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/graphql", forHTTPHeaderField: "Content-Type")

        let httpBodyString = #"""
{
  bikeRentalStations {
    name
    bikesAvailable
    realtime
    lat
    lon
  }
}
"""#
        urlRequest.httpBody = httpBodyString.data(using: .utf8)

        let task = urlSession.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
            self?.didGetBikeStations(data: data, error: error, completion: completion)
        }

        task.resume()
    }

    private func didGetBikeStations(data: Data?, error: Error?, completion: @escaping (BikeRentalStationsResponse?, Error?) -> Void) {
        guard let data = data, error == nil else {
            completion(nil, error)
            return
        }

        let jsonDecoder = JSONDecoder()

        let response: BikeRentalStationsResponse
        do {
            response = try jsonDecoder.decode(BikeRentalStationsResponse.self, from: data)
        } catch {
            completion(nil, error)
            return
        }

        completion(response, nil)
    }
}
