//
//  LoginBaseModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct LoginBaseModel: Codable {
    let code: Int?
    let status: String?
    let data: LoginDataModel?
}
