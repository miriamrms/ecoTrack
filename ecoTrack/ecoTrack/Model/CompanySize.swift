//
//  Porte.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 30/10/24.
//

import Foundation

enum CompanySize: String, Identifiable, CaseIterable{
    case micro = "Micro Empresa"
    case pequena = "Pequena Empresa"
    case media = "Média Empresa"
    
    var id: String {
        return self.rawValue
    }
}
