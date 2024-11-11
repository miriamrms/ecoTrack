//
//  CertificateData.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 10/11/24.
//

import Foundation
import SwiftData

@Model
class CertificateData: Identifiable {
    var id: String
    var type: CertificateType
    var actions: [Action]
    var progress: Double
    
    init(type: CertificateType, actions: [Action], progress: Double = 0.0) {
        id = UUID().uuidString
        self.type = type
        self.actions = actions
        self.progress = progress
    }
}

@Model
class Action: Identifiable {
    var id: String
    var name: String
    var isVerified: Bool
    
    init(name: String, isVerified: Bool = false) {
        id = UUID().uuidString
        self.name = name
        self.isVerified = isVerified
    }
}
