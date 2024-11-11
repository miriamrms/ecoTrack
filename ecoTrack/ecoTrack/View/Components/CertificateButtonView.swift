//
//  CertificateButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 30/10/24.
//

import SwiftUI

struct CertificateButtonView: View {
    
    var certificate: CertificateType
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.verdeEscuro)
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
                    
                    
                    Text(certificate.rawValue) //nome do certifcado
                        .font(
                            Font.system(size: 19)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                    
                    Text(certificate.description)//descrição de certificado
                        .font(Font.system(size: 14))
                        .foregroundColor(.white)
                    
                        .multilineTextAlignment(.leading)
                    
                }
                
                Spacer()
                
            }
            //.foregroundColor(.clear)
            
            
            
        }
        .frame(width: 353, height: 101)
    }
}

#Preview {
    //CertificateButtonView()
    CertificateButtonView(certificate: .iso)
}
