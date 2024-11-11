//
//  Resources.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 31/10/24.
//
import Foundation
import SwiftUI

enum Resources: String, CaseIterable, Codable{
    case agua = "Água"
    case energia = "Energia"
    case residuos = "Resíduos"
        
    var icone: String {
        switch self {
        case .agua:
            return "waterIcon"
        case .energia:
            return "energyIcon"
        case .residuos:
            return "wasteIcon"
        }
    }
    
    var cor: [Color] {
        switch self {
        case .agua:
            return [.azulAguaLight, .azulAgua]
        case .energia:
            return [.amareloEnergiaLight, .amareloEnergia]
        case .residuos:
            return [.laranjaResiLight, .laranjaResi]
        }
    }
    
    var bgImage: String {
        switch self {
        case .agua:
            return "bgDrop"
        case .energia:
            return "bgRay"
        case .residuos:
            return "bgTrash"
        }
    }
    
    var singleIcon: String {
        switch self {
        case .agua:
            return "dropSingleIcon"
        case .energia:
            return "raySingleIcon"
        case .residuos:
            return "trashSingleIcon"
        }
    }
    
    var comparativeIcon: String {
        switch self {
        case .agua:
            return "comparativeWater"
        case .energia:
            return "comparativeEnergy"
        case .residuos:
            return "comparativeWaste"
        }
    }
    
    var mediaIcon: String {
        switch self {
        case .agua:
            return "mediaWater"
        case .energia:
            return "mediaEnergy"
        case .residuos:
            return "mediaWaste"
        }
    }
    
    var measurement: String {
        switch self {
        case .agua:
            return "L"
        case .energia:
            return "kWh"
        case .residuos:
            return "Kg"
        }
    }
    
    var microEmpresa: Double {
        switch self {
        case .agua:
            return 100
        case .energia:
            return 300
        case .residuos:
            return 100
        }
    }
    
    var pequenaEmpresa: Double {
        switch self {
        case .agua:
            return 300
        case .energia:
            return 1500
        case .residuos:
            return 300
        }
    }
    
    var mediaEmpresa: Double {
        switch self {
        case .agua:
            return 1500
        case .energia:
            return 5000
        case .residuos:
            return 1000
        }
    }
    
    var goals: [[String]]{
        switch self {
        case .agua:
            return [["Instalação de arejadores"],["Instalação de calhas e cisternas para captação de água de chuva"]]
        case .energia:
            return [["Fazer adaptações no espaço com pontos de entrada para luz e vento"],["Substituir lâmpadas fluorescentes por LED"]]
        case .residuos:
            return [["Implantar coleta seletiva com os colaboradores e clientes"], ["Reduzir uso do papel"],["Incentivar o fim do uso de descartáveis pelos colaboradores"]]
        }
    }
}


enum Analysis: String, CaseIterable{
    case comparative = "Análise Comparativa"
    case media = "Média mensal"
}
