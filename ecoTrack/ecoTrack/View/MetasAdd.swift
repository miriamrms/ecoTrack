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
            Image(meta.tipo.icone)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.verdeClaro)
                .padding(.top, 20)

            Text(meta.descricao)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.verdeClaro)
                .padding()

            Divider()

            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Média")
                        .font(.caption)
                        .foregroundColor(.verdeClaro)
                    Text("Investimento Inicial")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.verdeClaro)
                }
                Spacer()
                Text("A partir de R$ \(meta.investimentoInicial, specifier: "%.2f")")
                    .foregroundColor(.verdeClaro)
            }
            .padding(.horizontal)
            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Média")
                        .font(.caption)
                        .foregroundColor(.verdeClaro)
                    Text("Economia a longo prazo")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.verdeClaro)
                }
                Spacer()
                Text("Até -\(meta.porcentagemReducao)% de gasto mensal")
                    .foregroundColor(.verdeClaro)
            }
            .padding(.horizontal)

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
        .background(Color.white)
        .cornerRadius(4)
        .shadow(radius: 10)
        .padding()
    }
}


struct AddMetaSheet: View {
    @ObservedObject var viewModel: MetasViewModel
    @State private var tipoSelecionado: TipoMeta = .geral
    @State private var descricao: String = ""
    @State private var investimentoInicial: String = ""
    @State private var porcentagemReducao: String = ""
    @Environment(\.presentationMode) var presentationMode // Adicionando para controlar o fechamento da sheet

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.verdeClaro)
                Text("Adicionar Meta")
                    .font(.title2)
                    .bold()
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
                        .font(.subheadline)
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
                                .foregroundColor(.primary) // Controla a cor do texto
                            Spacer()
                            Image(systemName: "chevron.down") // Seta para baixo
                                .foregroundColor(.gray) // Cor da seta
                        }
                        .padding()
                        .background(Color.white) // Define o fundo branco
                        .cornerRadius(4) // Bordas arredondadas
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.verdeClaro, lineWidth: 1) // Borda verde
                        )
                    }
                }
            }
            .padding(.bottom, 20)

            // Campo de Descrição
            VStack(alignment: .leading) {
                Text("Descrição")
                    .font(.subheadline)
                    .foregroundColor(.verdeClaro)
                TextEditor(text: $descricao) // Usando TextEditor no lugar de TextField
                    .frame(height: 100) // Defina a altura que deseja
                    .padding(.horizontal, 10) // Espaçamento interno para o texto
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.verdeClaro, lineWidth: 1) // Borda personalizada
                    )
            }

            // Campo de Investimento Inicial
            VStack(alignment: .leading) {
                Text("Investimento Inicial")
                    .font(.subheadline)
                    .foregroundColor(.verdeClaro)
                TextField("R$ 0,00", text: $investimentoInicial)
                    .keyboardType(.decimalPad)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.verdeClaro, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
            }

            // Campo de Porcentagem de Redução
            VStack(alignment: .leading) {
                Text("Porcentagem de Redução")
                    .font(.subheadline)
                    .foregroundColor(.verdeClaro)
                TextField("0%", text: $porcentagemReducao)
                    .keyboardType(.numberPad)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.verdeClaro, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
            }


            Button(action: {
                if camposValidos() {
                    viewModel.adicionarMeta(tipo: tipoSelecionado, descricao: descricao, investimentoInicial: Double(investimentoInicial) ?? 0, porcentagemReducao: Int(porcentagemReducao) ?? 0)
                    presentationMode.wrappedValue.dismiss() // Fecha a sheet
                }
            }) {
                HStack {
                    Image(systemName: "plus.square.fill")
                    Text("Adicionar meta")
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(camposValidos() ? Color.verdeClaro : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(4)
            }
            .padding(.top, 20)
            .disabled(!camposValidos()) // Desabilita o botão se os campos não forem válidos

            //Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Voltar")
                    .foregroundColor(.gray)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 35)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(4)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(4)
        .shadow(radius: 10)
    }

    // Função para validar os campos
    func camposValidos() -> Bool {
        return !descricao.isEmpty && !investimentoInicial.isEmpty && !porcentagemReducao.isEmpty && Double(investimentoInicial) != nil && Int(porcentagemReducao) != nil
    }
}


#Preview {
    MetasView()
}
