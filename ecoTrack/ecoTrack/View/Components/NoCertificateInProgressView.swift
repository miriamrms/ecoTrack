//
//  NoCertificateInProgressView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 10/11/24.
//

import SwiftUI

struct NoCertificateInProgressView: View {
    var body: some View {
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

#Preview {
    NoCertificateInProgressView()
}
