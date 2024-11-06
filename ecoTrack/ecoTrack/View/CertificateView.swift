//
//  SwiftUIView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 04/11/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        
        VStack{
            ZStack(alignment: .topLeading) {
                
                // BACKGROUND
                ZStack(alignment: .topTrailing) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 260)
                        .background(Color(.verdeClaro))
                    
                    
                    Image("treeScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 135, height: 305)
                    
                }
                
                //TEXTO
                VStack {
                    HStack(spacing: 11.5){
                        
                        Image("certificateSmallWhite")
                            .frame(width: 27, height: 27)
                        
                        Text("Certificados")
                            .font(
                                Font.system(size: 28)
                                    .weight(.bold)
                            )
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
//                    .overlay{
//                        Rectangle()
//                            .stroke(.red)
//                    }
                    .padding(.top, 96)
                    .padding(.leading, 20)
                    
                    // s B - Small
                    
                    Spacer()
                        .frame(maxHeight: 35)
                    
                    HStack {
                        Text("Em Progresso")
                            .font(
                                Font.system(size: 14)
                                    .weight(.bold)
                            )
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
//                    .overlay{
//                        Rectangle()
//                            .stroke(.red)
//                    }
                    .padding(.leading, 20)
                    
                    CertificateCardView()
                        .padding(.top, 10)
                    
                }
                
            
            }
            
            HStack {
                Text("Todos os certificados")
                    .font(
                        Font.system(size: 14)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.23, green: 0.33, blue: 0.44))
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
//                    .overlay{
//                        Rectangle()
//                            .stroke(.red)
//                    }
                    .padding(.leading, 20)
            .padding(.top, 20)
            
            CertificateButtonView()
//                .padding(.top, 10)
            
            CertificateButtonView()
                
            
            Spacer()
        }
        
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    SwiftUIView()
}
