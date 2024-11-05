//
//  CertificateButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 30/10/24.
//

import SwiftUI

struct CertificateButtonView: View {
    var body: some View {
        
        HStack {
            
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 75, height: 75)
                        .cornerRadius(6.74157)
                    
                    Image("treeCertificate")
                        .resizable()
                        .frame(width: 58.14589, height: 58.14607)
                }
                .padding(.leading, 10)
        
            Spacer()
                .frame(maxWidth: 10)
            
            VStack (alignment: .leading, spacing: 5){
                Text("ISO 14001")
                  .font(
                    Font.system(size: 19)
                      .weight(.bold)
                  )
                  .foregroundColor(.white)
                
               
                Text("Gestão ambiental eficaz para empresas sustentáveis.")
                  .font(Font.system(size: 14))
                  .foregroundColor(.white)
                  .frame(width: 204, alignment: .topLeading)
                
            }
            
            Spacer()
            
        }
        .foregroundColor(.clear)
        .frame(width: 353, height: 101)
        .background(Color(red: 0.1, green: 0.33, blue: 0.36))
        .cornerRadius(8)
        
        
    }
}

#Preview {
    CertificateButtonView()
}
