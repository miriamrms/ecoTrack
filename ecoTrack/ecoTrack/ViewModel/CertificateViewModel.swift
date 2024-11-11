//
//  CertificateViewModel.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 10/11/24.
//

import Foundation
import SwiftUI
import SwiftData

class CertificateViewModel: ObservableObject{
    @Published var certificates: [CertificateData] = []

    private let dataSource = SwiftDataService.shared
    
    init(dataSource: SwiftDataService) {
        certificates = dataSource.fetchCertificates()
    }
    
    func updateAction(_ action: Action) {
        dataSource.updateAction(action)
    }
    
    func getProgress(_ certificate: CertificateData) -> Double {
        let allActions = certificate.actions.count
        let completedActions = certificate.actions.filter{$0.isVerified == true}.count
        return Double(completedActions) * 100 / Double(allActions)
    }
    
    func updateProgress(_ certificate: CertificateData) {
        let progress = getProgress(certificate)
        dataSource.updateProgress(progress, certificate)
    }
}

extension CertificateData {
    static let fixedCertificates: [CertificateData] = [
        CertificateData(type: .iso, actions: [
            Action(name: "Identifique áreas de impacto ambiental."),
            Action(name: "Estabeleça metas de economia de água, energia e materiais."),
            Action(name: "Crie práticas para minimizar e reciclar resíduos."),
            Action(name: "Realize treinamentos em práticas sustentáveis e compliance."),
            Action(name: "Monitore o impacto ambiental com métricas específicas."),
            Action(name: "Defina e implemente ações para alcançar melhorias."),
            Action(name: "Avalie regularmente o progresso e ajuste práticas."),
        ]),
        CertificateData(type: .seloverde, actions: [
            Action(name: "Desenvolver uma estratégia de certificação de produtos e serviços com ciclo de vida sustentável."),
            Action(name: "Promover práticas de sustentabilidade e competitividade no mercado."),
            Action(name: "Garantir que produtos atendam aos critérios de acesso ao mercado internacional."),
            Action(name: "Estimular a adoção de práticas ASG em todos os setores da empresa."),
            Action(name: "Definir diretrizes sustentáveis em conjunto com o Comitê Gestor."),
            Action(name: "Estabelecer requisitos mínimos de sustentabilidade com base em normas técnicas."),
            Action(name: "Acreditar certificadoras para garantir a conformidade com os padrões ambientais.")
        ])
    ]
}
