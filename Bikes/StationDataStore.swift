//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import Foundation

class StationDataStore {
    private var favouriteStationIDs: Set<String>?
    private var blockedStationIDs: Set<String>?

    // As of today, using a shared container results in a spurious
    // warning on the console:
    //
    // > Using kCFPreferencesAnyUser with a container is only allowed
    //   for System Containers, detaching from cfprefsd.
    //
    // It seems to be benign.

    private lazy var sharedUserDefaults = UserDefaults(suiteName: "group.com.github.mnvr.bikes")

    private let favouriteStationIDsKey = "favouriteStationIDs"
    private let blockedStationIDsKey = "blockedStationIDs"

    private func readFromDiskIfNeeded() {
        if favouriteStationIDs == nil {
            if let stationIDs = sharedUserDefaults?.array(forKey: favouriteStationIDsKey) as? [String] {
                favouriteStationIDs = Set(stationIDs)
            } else {
                favouriteStationIDs = Set()
            }
        }

        if blockedStationIDs == nil {
            if let stationIDs = sharedUserDefaults?.array(forKey: blockedStationIDsKey) as? [String] {
                blockedStationIDs = Set(stationIDs)
            } else {
                blockedStationIDs = Set()
            }
        }
    }

    var favouriteAndBlockedStationIDs: (favouriteStationIDs: Set<String>?, blockedStationIDs: Set<String>?) {
        readFromDiskIfNeeded()
        return (favouriteStationIDs: favouriteStationIDs, blockedStationIDs: blockedStationIDs)
    }

    func isFavorite(stationID: String) -> Bool {
        readFromDiskIfNeeded()
        return favouriteStationIDs?.contains(stationID) == true
    }

    func setFavorite(_ value: Bool, stationID: String) {
        readFromDiskIfNeeded()

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
            if let favouriteStationIDs = favouriteStationIDs {
                let stationIDs = Array(favouriteStationIDs)
                sharedUserDefaults?.set(stationIDs, forKey: favouriteStationIDsKey)
            }
        }
    }

    func isBlocked(stationID: String) -> Bool {
        readFromDiskIfNeeded()
        return blockedStationIDs?.contains(stationID) == true
    }

    func setBlocked(_ value: Bool, stationID: String) {
        readFromDiskIfNeeded()

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
            if let blockedStationIDs = blockedStationIDs {
                let stationIDs = Array(blockedStationIDs)
                sharedUserDefaults?.set(stationIDs, forKey: blockedStationIDsKey)
            }
        }
    }
}
