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




//MARK: Company
//nome: String
//porte: String
//segmento: String
//
//recursos: [Recurso]
//residuos: [Residuo]
//certificadosEmProgresso: [Certificado]


//MARK: Residuos
//nome: String
//tipo: String
//quantidadeAcumulada: Double
//balanço: Double
//unidadeDeMedida: String
//histórico: [(quantidade: Float, data: Date)]
//descartes: [Descarte]

//MARK: Descarte
//local: String
//data: Date
//quantidade: Double
//preço: Double

