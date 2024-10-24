//
//  ButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 24/10/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        ZStack(alignment: .top){
            
                Rectangle()//retangulo maior fundo claro
                    .foregroundStyle(.azulAgua1)
                    .frame(width: 353,height: 100)
                    .cornerRadius(8)
            
                
            VStack{
                
                ZStack {
                    Rectangle()//retangulo menor escuro
                        .foregroundStyle(.azulAgua)
                        .frame(width: 352,height: 50)
                        .cornerRadius(8)
                    HStack{
                        Image("waterIcon")
                        Text("Água")//nome do recurso
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .bold))
                        Spacer()
                        Image("bar-chart-2")//
                            .frame(width: 0, height: 12)
                        Text("Média mensal")
                            .foregroundStyle(.white)
                            .font(.system(size: 10, weight: .medium))
                    }
                    .background(Color.gray)
                }
                .frame(width: 352,height: 50)
                HStack{
                    Image("ruler")
                    Text("100ml")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight:.bold))
                        .background(Color.black)
                    Spacer()
                    Image("coin")
                    Text("R$546,00")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            }
           
            
            
        }
        .frame(width: 353,height: 100)
        
    }
}

#Preview {
    ButtonView()
}
