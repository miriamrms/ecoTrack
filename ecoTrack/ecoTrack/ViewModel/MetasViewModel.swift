//
//  MetasViewModel.swift
//  ecoTrack
//
//  Created by Bruno Cezario on 31/10/24.
//

import SwiftUI

class MetasViewModel: ObservableObject {
    @Published var metas: [Meta] = [
        Meta(tipo: .agua, descricao: "Reduzir consumo de água", investimentoInicial: 100.0, porcentagemReducao: 10, concluida: false),
        Meta(tipo: .energia, descricao: "Economizar energia", investimentoInicial: 100.0, porcentagemReducao: 10, concluida: false),
        Meta(tipo: .energia, descricao: "Usar equipamentos que economizam energia", investimentoInicial: 100.0, porcentagemReducao: 10, concluida: false),
        Meta(tipo: .agua, descricao: "Instalar torneiras automaticas", investimentoInicial: 100.0, porcentagemReducao: 10, concluida: false),
        Meta(tipo: .residuos, descricao: "Reduzir resíduos", investimentoInicial: 100.0, porcentagemReducao: 10, concluida: true),
        Meta(tipo: .residuos, descricao: "Reciclar residuos", investimentoInicial: 100.0, porcentagemReducao: 10, concluida: false)
    ]
    
    @Published var showAddMetaSheet = false
    @Published var selectedMeta: Meta? = nil

    func toggleConcluida(for meta: Meta) {
        if let index = metas.firstIndex(where: { $0.id == meta.id }) {
            metas[index].concluida.toggle()
        }
    }

    func delete(meta: Meta) {
        metas.removeAll { $0.id == meta.id }
    }
    
    func adicionarMeta(tipo: TipoMeta, descricao: String, investimentoInicial: Double, porcentagemReducao: Int) {
        let novaMeta = Meta(tipo: tipo, descricao: descricao, investimentoInicial: investimentoInicial, porcentagemReducao: porcentagemReducao, concluida: false)
        metas.append(novaMeta)
    }
}
