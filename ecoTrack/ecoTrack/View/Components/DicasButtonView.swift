//
//  DicasButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 06/11/24.
//

import SwiftUI

struct DicasButtonView: View {
    
    
    var body: some View {
        Button {} //botao de dicas
        
        label: {
               
            VStack{
                ZStack {
                    Rectangle()
                        .frame(width: 353,height: 100)
                        .cornerRadius(8)
                        .foregroundStyle(Color(red: 0.95, green: 0.95, blue: 0.95))
                    
                    HStack(spacing: 20) {
                        Image("lampHome")
                        
                        VStack(alignment: .leading ){
                            Text("USO DE ENERGIA")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundStyle(Color(red: 0.56, green: 0.56, blue: 0.56))
                            Spacer()
                                .frame(height: 7)
                            Text("Adotar ilumicacao de LED pode fazer com que a empresa use menos energia elétrica, gerando benefícios para o planeta e também para seus cofres.")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.black)
                        }
                        .multilineTextAlignment(.leading)
                        .frame(width: 239, height: 68 )
                        
                    }
                    
                } .frame(width: 353,height: 100)
                ZStack {
                    Rectangle()
                        .frame(width: 353,height: 100)
                        .cornerRadius(8)
                        .foregroundStyle(Color(red: 0.95, green: 0.95, blue: 0.95))
                    
                    HStack(alignment: .top, spacing: 20) {
                        Image("dropHome")
                        
                        VStack(alignment: .leading){
                            Text("USO DE ÁGUA")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundStyle(Color(red: 0.56, green: 0.56, blue: 0.56))
                               // .frame(maxWidth: .infinity)
//                                .multilineTextAlignment(.leading)
                                .multilineTextAlignment(TextAlignment.leading)
                                
                            
                            Spacer()
                                .frame(height: 7)
                            Text("Reutilização de água é uma prática sustentável que reduz o consumo e o desperdício. Dessa forma é possível economizar recursos e diminuir o impacto ambiental.")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.black)
                                
                        }.frame(width: 239, height: 68 )
                        .multilineTextAlignment(.leading)
                        
                        
                        
                    }
                    
                } .frame(width: 353,height: 100)
                ZStack {
                    Rectangle()
                        .frame(width: 353,height: 100)
                        .cornerRadius(8)
                        .foregroundStyle(Color(red: 0.95, green: 0.95, blue: 0.95))
                    
                    HStack(spacing: 20) {
                        Image("trashHome")
                        
                        VStack(alignment: .leading ){
                            Text("DESCARTE DE RESÍDUOS")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundStyle(Color(red: 0.56, green: 0.56, blue: 0.56))
                            Spacer()
                                .frame(height: 7)
                            Text("Adotar medidas como a Coleta seletiva pode reduzir o volume de resíduos e facilitar a reciclagem. Separando materiais como papel, plástico, metal e vidro, contribuímos para a diminuição do desperdício.")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.black)
                        }
                        .multilineTextAlignment(.leading)
                        .frame(width: 239, height: 68 )
                        
                    }
                    
                } .frame(width: 353,height: 100)
            }
            
            
        }
    }
}

#Preview {
    DicasButtonView()
}
