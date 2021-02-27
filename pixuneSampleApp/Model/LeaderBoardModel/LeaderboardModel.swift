//
//  LeaderboardModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct LeaderboardModel: Codable {
    let playFabID, displayName: String?
    let statValue, position: Int?
    let profile: ProfileModel?

    enum CodingKeys: String, CodingKey {
        case playFabID = "PlayFabId"
        case displayName = "DisplayName"
        case statValue = "StatValue"
        case position = "Position"
        case profile = "Profile"
    }
}
