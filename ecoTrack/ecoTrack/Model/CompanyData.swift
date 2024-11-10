//
//  CompanyData.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 05/11/24.
//

import Foundation
import SwiftData

@Model
class CompanyData: Identifiable {
    var name: String
    var companySize: CompanySize
    
    init(name: String, companySize: CompanySize) {
        self.name = name
        self.companySize = companySize
    }
}
