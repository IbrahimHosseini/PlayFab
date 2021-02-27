//
//  EntityTokenModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct EntityTokenModel: Codable {
    let entityToken, tokenExpiration: String?
    let entity: EntityModel?

    enum CodingKeys: String, CodingKey {
        case entityToken = "EntityToken"
        case tokenExpiration = "TokenExpiration"
        case entity = "Entity"
    }
}
