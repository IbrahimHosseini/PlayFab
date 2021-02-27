//
//  LeaderBoardDataModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct LeaderBoardDataModel: Codable {
    let leaderboard: [LeaderboardModel]?
        let version: Int?

        enum CodingKeys: String, CodingKey {
            case leaderboard = "Leaderboard"
            case version = "Version"
        }
}
