//
//  EntityModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct EntityModel: Codable {
    let id, type, typeString: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case type = "Type"
        case typeString = "TypeString"
    }
}
