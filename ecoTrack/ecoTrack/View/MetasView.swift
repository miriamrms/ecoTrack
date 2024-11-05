//
//  MetaView.swift
//  ecoTrack
//
//  Created by Bruno Cezario on 31/10/24.
//

import SwiftUI

enum TipoMeta: String, CaseIterable {
    case geral, agua, energia, residuos

    var icone: String {
        switch self {
        case .agua: return "gota"
        case .energia: return "raio"
        case .residuos: return "lixeira"
        case .geral: return "folha"
        }
    }

    var cor: [Color] {
        switch self {
        case .agua: return [.azulAgua, .verdeClaro]
        case .energia: return [.amareloEnergia, .verdeClaro]
        case .residuos: return [.laranjaResi, .verdeClaro]
        case .geral: return [.verdeClaroDark, .verdeClaro]
        }
    }
    
    var corClara: [Color] {
        switch self {
        case .agua: return [.azulAguaLight, .verdeClaroLight]
        case .energia: return [.amareloEnergiaLight, .verdeClaroLight]
        case .residuos: return [.laranjaResiLight, .verdeClaroLight]
        case .geral: return [.verdeClaro, .verdeClaroLight]
        }
    }
}

struct Meta: Identifiable {
    let id = UUID()
    var tipo: TipoMeta
    var descricao: String
    var investimentoInicial: Double
    var porcentagemReducao: Int
    var concluida: Bool
}

struct MetasView: View {
    @ObservedObject var viewModel = MetasViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Image("metasLogo")
                    Text("Metas")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.verdeClaro)
                    Spacer()
                    Button(action: { viewModel.showAddMetaSheet.toggle() }) {
                        Image(systemName: "plus")
                            .font(.system(size: 34))
                            .foregroundColor(.verdeClaro)
                    }
                }
                .padding(.top)
                .padding(.top)
                .padding(.top)
                .padding(.top)
                .padding([.leading, .trailing, .top])
                Rectangle()//divisoria verde
                    .frame(maxWidth: 400)
                    .padding(.horizontal)
                    .frame(height: 1)
                    .foregroundStyle(.verdeClaro)
                List {
                    Section(header: Text("Metas")) {
                        ForEach(viewModel.metas.filter { !$0.concluida }) { meta in
                            MetaItemView(meta: meta) {
                                viewModel.toggleConcluida(for: meta)
                            }
                            .onTapGesture {
                                viewModel.selectedMeta = meta
                            }
                        }
                    }

                    Section(header: Text("Metas Concluídas")) {
                        ForEach(viewModel.metas.filter { $0.concluida }) { meta in
                            MetaItemView(meta: meta) {
                                viewModel.toggleConcluida(for: meta)
                            }
                            .onTapGesture {
                                viewModel.selectedMeta = meta
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .sheet(isPresented: $viewModel.showAddMetaSheet) {
                    AddMetaSheet(viewModel: viewModel)
                }
                .sheet(item: $viewModel.selectedMeta) { meta in
                    MetaPopup(meta: meta, onDelete: {
                        viewModel.delete(meta: meta)
                        viewModel.selectedMeta = nil
                    })
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    MetasView()
}
