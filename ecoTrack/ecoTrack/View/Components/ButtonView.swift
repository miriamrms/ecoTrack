//
//  ButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 24/10/24.
//

import SwiftUI


struct ButtonView: View {

    @State var valor: Double = 0.0
    var recurso: Resources
    
    var body: some View {
       
        Button {} //botao de recursos
        
        label: {
            ZStack(alignment: .top){
                
                    Rectangle()//retangulo maior fundo claro
                    .foregroundStyle(recurso.cor[0])
                        .frame(width: 353,height: 100)
                        .cornerRadius(8)
                
                    
                VStack{
                    
                    ZStack {//retangulo superior escuro
                        UnevenRoundedRectangle (topLeadingRadius: 8, topTrailingRadius: 8)
                            .frame(width: 353, height: 50)
                            .foregroundStyle(recurso.cor[1])
                        
                        
                        HStack{ //infos parte superior
                            Image(recurso.icone)
                                
                            Text(recurso.rawValue)//nome do recurso
                                .foregroundStyle(.white)
                                .font(.system(size: 19, weight: .bold))
                                
                            Spacer()//espaco do meio entre agua e media
                                .frame(maxWidth: .infinity )
                            
                            Image("bar-chart-2")//icone de media mensal
                                .frame(width: 0, height: 12)
                                .padding(.bottom, 5)//alinha com texto media mensal
                            
                            Spacer()//espaco entre icone de barras e texto media mensal
                                .frame(maxWidth: 10)
                            
                            Text("Média mensal")
                                .foregroundStyle(.white)
                                .font(.system(size: 10, weight: .medium))
                        }
                        
                        .frame(maxWidth: 329)//.infinity)
                        //.background(Color.gray)
                        
                    }
                    
                    .frame(height: 50)
                    .frame( maxWidth: .infinity)
                    
                    Spacer() //alinhamento centralizado das informacoes inferiores
                        .frame(maxHeight: 13)
                    if valor == 0{
                        
                        HStack{ //infos parte inferior nao preenchida

                            Spacer()
                                .frame(maxWidth: 12)
                            
                            Image("plus")
                            
                            Spacer()
                                .frame(maxWidth: 10)
                            
                            Text("Adicione seus gastos mensais")
                                .foregroundStyle(.white)
                                .font(.system(size: 12, weight:.bold))
                                .frame(maxWidth: 104, maxHeight: 30)
                                .multilineTextAlignment(TextAlignment.leading)
                              
                            Spacer()
                                .frame(maxWidth: .infinity)
                        
                        }
                        .frame(maxWidth: .infinity)

                        
                        Spacer() //alinhamento centralizado das informacoes inferiores
                            .frame(maxHeight: 9)
                    }
                    else{
                        HStack{ //infos parte inferior
                            
                            Image("ruler")
                            Text("100ml")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight:.bold))
                            
                            Spacer()//espaco entre ml e coin icon
                                .frame(maxWidth:27)
                            
                            Image("coin")
                            Text("R$546,00")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                            
                            Spacer()
                                .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: 329)//.infinity)
                        //.background(Color.gray)
                    }
                }
            }
            
            .frame(width: 353,height: 100)
        }
    }
}

#Preview {
    ButtonView(recurso: .residuos)
}
