//
//  Porte.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 30/10/24.
//

import Foundation
import SwiftData

enum CompanySize: String, Identifiable, CaseIterable, Codable {
    case micro = "Micro Empresa"
    case pequena = "Pequena Empresa"
    case media = "Média Empresa"
    
    var id: String {
        return self.rawValue
    }
    
    var icon: String {
        switch self {
        case .micro:
            return "porteMicro"
        case .pequena:
            return "portePequeno"
        case .media:
            return "porteMedio"
        }
    }
    
    var group: String {
        switch self {
        case .micro:
            return "Empresas de Porte Micro"
        case .pequena:
            return "Empresas de Pequeno Porte"
        case .media:
            return "Empresas de Médio Porte"
        }
    }
}
