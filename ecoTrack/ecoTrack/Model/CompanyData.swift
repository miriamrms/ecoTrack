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
@Model
class ResourceData: Identifiable {
    var id: String
    var name: String
    var history: [SpendData]
    var spendMedia: Double
    var mesureUnit: String
    
    init(name: String, history: [SpendData], spendMedia: Double, mesureUnit: String) {
        id = UUID().uuidString
        self.name = name
        self.history = history
        self.spendMedia = spendMedia
        self.mesureUnit = mesureUnit
    }
}
@Model
class SpendData: Identifiable {
    var id: String
    var data: Date
    var price: Double
    var amount: Double
    
    init(data: Date, price: Double, amount: Double) {
        id = UUID().uuidString
        self.data = data
        self.price = price
        self.amount = amount
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

