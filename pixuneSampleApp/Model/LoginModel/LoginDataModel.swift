//
//  LoginDataModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct LoginDataModel: Codable {
    let sessionTicket, playFabID: String?
    let newlyCreated: Bool?
    let settingsForUser: SettingsForUserModel?
    let lastLoginTime: String?
    let entityToken: EntityTokenModel?
    let treatmentAssignment: TreatmentAssignmentModel?

    enum CodingKeys: String, CodingKey {
        case sessionTicket = "SessionTicket"
        case playFabID = "PlayFabId"
        case newlyCreated = "NewlyCreated"
        case settingsForUser = "SettingsForUser"
        case lastLoginTime = "LastLoginTime"
        case entityToken = "EntityToken"
        case treatmentAssignment = "TreatmentAssignment"
    }
}
