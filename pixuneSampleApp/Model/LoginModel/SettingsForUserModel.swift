//
//  SettingsForUserModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct SettingsForUserModel: Codable {
    let needsAttribution, gatherDeviceInfo, gatherFocusInfo: Bool?

    enum CodingKeys: String, CodingKey {
        case needsAttribution = "NeedsAttribution"
        case gatherDeviceInfo = "GatherDeviceInfo"
        case gatherFocusInfo = "GatherFocusInfo"
    }
}
