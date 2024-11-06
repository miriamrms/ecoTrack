//
//  CertificateCardView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 04/11/24.
//

import SwiftUI

struct CertificateCardView: View {
    
    @State var certificateState = true 
    @State var certificateProgress: Double = 100
    
    var body: some View {
        
        
        Button {
            if certificateState == true {
    
            }
            else{
                
            }
        } label: {
            
            //MARK: - BOTAO COM PROGRESSO
            if certificateState == true {
                ZStack(alignment: .trailing){
                    
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 8) {
                            Text("ISO 14001")
                                .font(
                                    Font.system(size: 19)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                            
                            
                            HStack {
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 191, height: 10)
                                        .cornerRadius(25)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .inset(by: 0.5)
                                                .stroke(Color(red: 0.61, green: 0.69, blue: 0.25), lineWidth: 1)
                                        )
                                    
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: CGFloat(certificateProgress), height: 10)
                                        .background(Color(red: 0.61, green: 0.69, blue: 0.25))
                                        .cornerRadius(25)
                                    
                                }
                                
                                Text("70%")
                                    .font(
                                        Font.system(size: 14)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.leading, 60)
                        .padding(.trailing, 10)
                        
                        
                        
                    }
                    .foregroundColor(.clear)
                    .frame(width: 306, height: 94)
                    
                    .background(Color(red: 0.1, green: 0.33, blue: 0.36))
                    .cornerRadius(8)
                    
                    
                    Image("treeCertificate")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                .frame(width: 355, height: 98.96429)
                
            } else {
                
                ZStack(alignment: .trailing){
                    
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nenhum certificado em progresso.")
                                .font(
                                    Font.system(size: 19)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                            
                            
                            
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                        
                        
                        
                    }
                    .foregroundColor(.clear)
                    .frame(width: 306, height: 94)
                    
                    .background(Color(red: 0.22, green: 0.47, blue: 0.51))
                    .cornerRadius(8)
                    
                    
                    Image("treeCertificateClaro")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                .frame(width: 355, height: 98.96429)
                
            }
            
            
        }
        
        
    }
}

#Preview {
    CertificateCardView()
}
