//
//  MetaItemView.swift
//  ecoTrack
//
//  Created by Bruno Cezario on 31/10/24.
//

import SwiftUI

struct MetaItemView: View {
    var meta: Meta
    var onToggle: () -> Void

    var body: some View {
        HStack {
            Image(meta.tipo.icone)
//  `78                .font(.title2) //????
                .foregroundColor(.white)
//                .foregroundColor(meta.concluida ? .gray : .white)

            Text(meta.descricao)
                //.font(.body) //Aqui não
                .font(.system(size: 14, weight: .bold)) // AQUI MESMOOOO!!!
                .foregroundColor(.white)
//                .foregroundColor(meta.concluida ? .gray : .white)

            Spacer()

            Button(action: {
                onToggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 2)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)

                    // Check verde quando a meta estiver concluída
                    if meta.concluida {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                }
                .background(meta.concluida ? Color.white : Color.clear)
                .cornerRadius(4)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: meta.concluida ? meta.tipo.corClara : meta.tipo.cor),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(10)
    }
}



#Preview {
    VStack(spacing: 16) {
        // meta concluida
        MetaItemView(
            meta: Meta(
                tipo: .agua,
                descricao: "Instalar torneiras automáticas",
                investimentoInicial: 100.0,
                porcentagemReducao: 10,
                concluida: false
            ),
            onToggle: {}
        )
        // meta nao concluida
        MetaItemView(
            meta: Meta(
                tipo: .agua,
                descricao: "Reduzir consumo de água",
                investimentoInicial: 50.0,
                porcentagemReducao: 20,
                concluida: true
            ),
            onToggle: {}
        )
    }
    .padding()
}



