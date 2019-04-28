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

    struct BikeRentalStation: Decodable {
        var stationId: String?
        /// Name of the bike rental station
        var name: String?
        /// Number of bikes currently available on the rental station.
        var bikesAvailable: Int?
        /// Number of free spaces currently available on the rental station.
        var spacesAvailable: Int?
        /// If true, values of bikesAvailable and spacesAvailable are
        /// updated from a real-time source. If false, values of bikesAvailable
        /// and spacesAvailable are always the total capacity divided by two.
        var realtime: Bool?
        /// Longitude of the bike rental station (WGS 84)
        var lon: Float?
        /// Latitude of the bike rental station (WGS 84)
        var lat: Float?
        /// Values seen so far:
        /// - "Station on"
        /// - "Station off"
        var state: String?
        static let stateStationOn = "Station on"
        static let stateStationOff = "Station off"
    }

    struct BikeRentalStationsResponse: Decodable {
        var data: BikeRentalStationsResponseData?
    }

    struct BikeRentalStationsResponseData: Decodable {
        var bikeRentalStations: [BikeRentalStation]?
    }

    func getBikeRentalStations(completion: @escaping (BikeRentalStationsResponse?, Error?) -> Void) {
        // Get all bikes
        // Interactive API playground at
        /*
         https://api.digitransit.fi/graphiql/hsl?query=%7B%0A%20%20bikeRentalStations%20%7B%0A%20%20%20%20stationId%0A%20%20%20%20name%0A%20%20%20%20bikesAvailable%0A%20%20%20%20spacesAvailable%0A%20%20%20%20realtime%0A%20%20%20%20lat%0A%20%20%20%20lon%0A%20%20%20%20state%0A%20%20%7D%0A%7D
         */

        // For an example response, see MockResponses.swift

        let graphQLString = #"""
{
  bikeRentalStations {
    stationId
    name
    bikesAvailable
    spacesAvailable
    realtime
    lat
    lon
    state
  }
}
"""#
        #if DEBUG
        if ProcessInfo.processInfo.environment["BIKES_MOCK_HTTP"]?.isEmpty == false {
            if let mockData = MockResponses().bikeRentalStations.data(using: .utf8) {
                NSLog("Using MockResponse for bikeRentalStations query")

                // Insert a random delay between 0 and 5 seconds.
                let delay = Double.random(in: 0..<5)

                DispatchQueue.global().asyncAfter(deadline: .now() + delay) { [weak self] in
                    self?.didGetBikeStations(data: mockData, error: nil, completion: completion)

                }

                return
            }
        }
        #endif

        getRoutingGraphQL(graphQLString) { [weak self] (data, error) in
            self?.didGetBikeStations(data: data, error: error, completion: completion)
        }
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

    private func getRoutingGraphQL(_ graphQLString: String, completion: @escaping (Data?, Error?) -> Void) {
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
        urlRequest.httpBody = graphQLString.data(using: .utf8)

        let task = urlSession.dataTask(with: urlRequest) { (data, urlResponse, error) in
            completion(data, error)
        }

        task.resume()
    }

    /*
 {
  "data": {
    "nearest": {
      "edges": [
        {
          "node": {
            "place": {
              "id": "QmlrZVJlbnRhbFN0YXRpb246MjAz",
              "bikesAvailable": 3,
              "name": "Opastinsilta"
            },
            "distance": 239
          }
        },
     */

    struct NearestBikeRentalStationsResponse: Decodable {
        var data: NearestBikeRentalStationsResponseData?
    }

    struct NearestBikeRentalStationsResponseData: Decodable {
        var nearest: NearestBikeRentalStationsResponseNearest?
    }

    struct NearestBikeRentalStationsResponseNearest: Decodable {
        var edges: [NearestBikeRentalStationsResponseEdge]?
    }

    struct NearestBikeRentalStationsResponseEdge: Decodable {
        var node: NearestBikeRentalStationsResponseNode?
    }

    struct NearestBikeRentalStationsResponseNode: Decodable {
        var place: BikeRentalStation?
        var distance: Int?
    }

    func getNearestBikeRentalStations(latitude: Double, longitude: Double, completion: @escaping (NearestBikeRentalStationsResponse?, Error?) -> Void) {
        // For finding bikes near a point, use the following GraphQL
        // Interactive API URL:
        /*
         https://api.digitransit.fi/graphiql/hsl?query=%7B%0A%09nearest(lat%3A%2060.19915%2C%20lon%3A%2024.94089%2C%20maxDistance%3A%20500%2C%20filterByPlaceTypes%3A%20BICYCLE_RENT)%20%7B%0A%20%20%20%20edges%20%7B%0A%20%20%20%20%20%20node%20%7B%0A%20%20%20%20%20%20%20%20place%20%7B%0A%20%20%20%20%20%20%20%20%20%20id%0A%20%20%20%20%20%20%20%20%20%20...on%20BikeRentalStation%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20bikesAvailable%0A%20%20%20%20%20%20%20%20%20%20%20%20id%0A%20%20%20%20%20%20%20%20%20%20%20%20name%0A%20%20%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%09distance%0A%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%0A%20%20%7D%0A%7D%0A%09
         */

        let graphQLString = #"""
{
    nearest(lat: \#(latitude), lon: \#(longitude), maxDistance: 1000, filterByPlaceTypes: BICYCLE_RENT) {
      edges {
        node {
          place {
            id
            ...on BikeRentalStation {
              bikesAvailable
              name
              realtime
            }
          }
          distance
       }
     }
   }
}
"""#

        getRoutingGraphQL(graphQLString) { [weak self] (data, error) in
            self?.didGetNearestBikeRentalStations(data: data, error: error, completion: completion)
        }
    }

    private func didGetNearestBikeRentalStations(data: Data?, error: Error?, completion: @escaping (NearestBikeRentalStationsResponse?, Error?) -> Void) {
        guard let data = data, error == nil else {
            completion(nil, error)
            return
        }

        let jsonDecoder = JSONDecoder()

        let response: NearestBikeRentalStationsResponse
        do {
            response = try jsonDecoder.decode(NearestBikeRentalStationsResponse.self, from: data)
        } catch {
            completion(nil, error)
            return
        }

        completion(response, nil)
    }
}
