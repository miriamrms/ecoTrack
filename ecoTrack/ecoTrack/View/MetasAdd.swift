//
//  MetasAdd.swift
//  ecoTrack
//
//  Created by Bruno Cezario on 31/10/24.
//

import SwiftUI

struct MetaPopup: View {
    var meta: Meta
    var onDelete: () -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Image(meta.tipo.icone)//systemName: "house")//meta.tipo.icone) //)
                //.resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.verdeClaro)
                //.fill(.verdeClaro)
                //.tint(.verdeClaro)
                .foregroundColor(.verdeClaro) //(.black)
                .padding(.top, 20)

            Text(meta.descricao)
                //.font(.headline)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.verdeClaro)
                //.padding()

            Divider()
            if meta.investimentoInicial > 0 {
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Média \n")
                            .font(.system(size: 11))
                            .fontWeight(.regular)
                            .foregroundColor(.verdeClaro)
                        Text("Investimento Inicial")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.verdeClaro)
                    }
                    Spacer()
                    
                    Text("\n A partir de R$ \(meta.investimentoInicial, specifier: "%.2f")")
                        .foregroundColor(.verdeClaro)
                }
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.horizontal)
            }
            
            if meta.porcentagemReducao > 0 {
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Média \n")
                            .font(.system(size: 11))
                            .fontWeight(.regular)
                            .foregroundColor(.verdeClaro)
                        Text("Economia a longo prazo")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.verdeClaro)
                    }
                    Spacer()
                    Text("\n Até -\(meta.porcentagemReducao)% de gasto mensal")
                        .foregroundColor(.verdeClaro)
                }
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.horizontal)

            }
            
            Spacer()

            VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Voltar")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.verdeClaro)
                        .cornerRadius(4)
                }

                Button(action: {
                    onDelete()
                }) {
                    Text("Excluir Meta")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 35)
                        .background(Color.fail)
                        .cornerRadius(4)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding()
        .frame(maxWidth: .infinity)
       // .background(Color.blue)
        .cornerRadius(4)
        .shadow(radius: 10)
        .padding()
    }
}


struct AddMetaSheet: View {
    @ObservedObject var viewModel: MetasViewModel
    @State private var tipoSelecionado: TipoMeta = .geral
    @State private var descricao: String = ""
    @Environment(\.presentationMode) var presentationMode // Adicionando para controlar o fechamento da sheet

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.verdeClaro)
                Text("Adicionar Meta")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.verdeClaro)
            }
            .padding(.bottom, 20)

            // Seleção do Tipo de Meta com icone
            HStack {
                Image(tipoSelecionado.icone)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.verdeClaro)
                    .padding(.trailing, 8)
                VStack(alignment: .leading) {
                    Text("Tipo de Meta")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.verdeClaro)
                    //comeco
                    Menu {
                        ForEach(TipoMeta.allCases, id: \.self) { tipo in
                            Button(action: {
                                tipoSelecionado = tipo
                            }) {
                                Text(tipo.rawValue.capitalized)
                            }
                        }
                    } label: {
                        HStack {
                            Text(tipoSelecionado.rawValue.capitalized)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.verdeClaro, lineWidth: 1)
                        )
                    }
                }
            }
            .padding(.bottom, 20)

            // Campo de Descrição
            VStack(alignment: .leading) {
                Text("Descrição")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.verdeClaro)
                TextEditor(text: $descricao) // Usando TextEditor no lugar de TextField
                    .frame(height: 100)
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.verdeClaro, lineWidth: 1) // Borda personalizada
                    )
            }

            // Botão para adicionar meta
                        Button(action: {
                            if !descricao.isEmpty {
                                viewModel.adicionarMeta(tipo: tipoSelecionado, descricao: descricao)
                                presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            HStack {
                                Image(systemName: "plus.square.fill")
                                Text("Adicionar meta")
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(!descricao.isEmpty ? Color.verdeClaro : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                        }
                        .padding(.top, 20)
                        .disabled(descricao.isEmpty)

                        // Botão Voltar
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Voltar")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(maxHeight: 35)
                                .background(Color(UIColor.darkLight))
                                .cornerRadius(4)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(4)
                    .shadow(radius: 10)
                }
            }


#Preview {
    MetasView()
}
