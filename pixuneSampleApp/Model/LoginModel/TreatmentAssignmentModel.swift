//
//  TreatmentAssignmentModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct TreatmentAssignmentModel: Codable {
    let variants, variables: [String]?
    
    enum CodingKeys: String, CodingKey {
        case variants = "Variants"
        case variables = "Variables"
    }
}
