//
//  ProfileModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct ProfileModel: Codable {
    let publisherID: String?
    let titleID: String?
    let playerID, displayName: String?

    enum CodingKeys: String, CodingKey {
        case publisherID = "PublisherId"
        case titleID = "TitleId"
        case playerID = "PlayerId"
        case displayName = "DisplayName"
    }
}
