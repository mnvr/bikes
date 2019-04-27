//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import Foundation

class StationDataStore {
    private var favouriteStationIDs: Set<String>?
    private var blockedStationIDs: Set<String>?

    private func readFromDiskIfNeeded() {

    }

    func isFavorite(stationID: String) -> Bool {
        readFromDiskIfNeeded()
        return favouriteStationIDs?.contains(stationID) == true
    }

    func setFavorite(_ value: Bool, stationID: String) {
        var shouldUpdateDisk = false

        if value {
            if favouriteStationIDs?.insert(stationID).inserted == true {
                shouldUpdateDisk = true
            }
        } else {
            if favouriteStationIDs?.remove(stationID) != nil {
                shouldUpdateDisk = true
            }
        }

        if shouldUpdateDisk {

        }
    }

    func isBlocked(stationID: String) -> Bool {
        readFromDiskIfNeeded()
        return blockedStationIDs?.contains(stationID) == true
    }

    func setBlocked(_ value: Bool, stationID: String) {
        var shouldUpdateDisk = false

        if value {
            if blockedStationIDs?.insert(stationID).inserted == true {
                shouldUpdateDisk = true
            }
        } else {
            if blockedStationIDs?.remove(stationID) != nil {
                shouldUpdateDisk = true
            }
        }

        if shouldUpdateDisk {

        }
    }
}
