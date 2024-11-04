//
//  ResourcesView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 31/10/24.
//

import SwiftUI

struct ResourceView: View {
    var resource: Resources
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    
    var body: some View {
        VStack(spacing: 40){
            ZStack{
                resource.cor[1] //Cor do Recurso
                Image(resource.bgImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: width)
                
                VStack(){
                    HStack{
                        Image(resource.singleIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 27)
                        Text(resource.rawValue)
                    }
                    .padding(.top, height * 0.08)
                    .font(.system(size: 19, weight: .bold))
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            HStack(alignment: .bottom){
                                Image("bar-chart-2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 27)
                                Text("Média Mensal")
                            }
                            .font(.system(size: 16, weight: .regular))
                            Divider()
                                .overlay(Color.white)
                            HStack{
                                Image("ruler")
                                Text("1652 L")
                            }
                            .font(.system(size: 23, weight: .bold))
                            HStack{
                                Image("coin")
                                Text("R$657,00")
                            }
                            .font(.system(size: 23, weight: .bold))
                            
                        }
                        .frame(width: width*0.40)
                        Spacer()
                        VStack{
                            Button {
                                //
                            } label: {
                                ZStack{
                                    HStack{
                                        Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                                            .font(.system(size: 18, weight: .bold))
                                        Text("Histórico")
                                    }
                                    .foregroundColor(resource.cor[1])
                                    .padding(.top, 14)
                                    .padding(.bottom, 14)
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(8)
                            }
                            Button {
                                //
                            } label: {
                                ZStack{
                                    VStack{
                                        Image(systemName: "plus.app")
                                            .font(.system(size: 18, weight: .bold))
                                        Text("Adicionar Gasto Mensal")
                                    }
                                    .foregroundColor(resource.cor[1])
                                    .padding(.top, 14)
                                    .padding(.bottom, 14)
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(8)
                            }

                        }
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: width*0.34)
                    }
                    .padding(.bottom, 20)
                }
                .padding(20)
                
                
            }
            .ignoresSafeArea()
            .frame(maxHeight: 299)
            .foregroundColor(Color.white)
            .frame(alignment: .top)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(Analysis.allCases, id: \.self){ analysis in
                        AnalysisButtonView(analysis: analysis, resource: resource, valor: 0.3)
                    }
                }
            }
            VStack{
                
            }
        }
    }
}

#Preview {
    ResourceView(resource: .agua)
}
