//
//  Certificate.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 08/11/24.
//


enum Certificate: String, CaseIterable {
    case iso = "ISO 1401 "
    case seloverde = "Selo Verde"
    
    var description: String {
        switch self {
        case .iso:
            return "Gestão ambielntal eficaz para empresas sustentáveis"
        case .seloverde: return "Reconhecimento por práticas empresariais sustentáveis"
        }
    }
    var goals: [String] {
        switch self {
        case .iso:
            return ["Economize agua","Reduzir despesas","Reduzir impacto ambiental"]
        case .seloverde:
            return ["",""]
        }
    }
    
    var link: String {
        switch self {
        case .iso:
            return "https://certificacaoiso.com.br/iso-14001-2/"
        case .seloverde:
            return "https://sebrae.com.br/sites/PortalSebrae/artigos/voce-sabe-o-que-e-selo-verde,a031949fca8e4810VgnVCM100000d701210aRCRD#:~:text=O%20selo%20verde%20é%20uma,como%20certificação%20verde%20ou%20ecosselo."
        }
    }
    
}
