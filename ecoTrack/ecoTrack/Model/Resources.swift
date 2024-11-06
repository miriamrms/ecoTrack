//
//  Resources.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 31/10/24.
//
import Foundation
import SwiftUI

enum Resources: String, CaseIterable{
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
}

enum Analysis: String, CaseIterable{
    case comparative = "Análise Comparativa"
    case media = "Média mensal"
}
