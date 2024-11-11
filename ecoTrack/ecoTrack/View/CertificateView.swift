//
//  SwiftUIView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 04/11/24.
//

import SwiftUI

struct CertificateView: View {
    @StateObject var certificateViewModel: CertificateViewModel = CertificateViewModel(dataSource: .shared)

    var body: some View {
        NavigationStack {
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
                        .padding(.top, 96)
                        .padding(.leading, 20)
                        
                        
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
                        .padding(.leading, 20)
                        
                        if certificateViewModel.isAnyCertificateInProgress() {
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ForEach(certificateViewModel.certificates, id: \.self){
                                        certificate in
                                        if certificate.progress > 0 {
                                            CertificateCardView( certificate: certificate)
                                                .environmentObject(certificateViewModel)
                                                .padding(.top, 10)
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                        else{
                            HStack{
                                NoCertificateInProgressView()
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        
                        
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
                
//                ForEach(Certificate.allCases, id: \.self){ certificate in
//                    NavigationLink {
//                        CertificatePageView(certificate: certificate)
//                    } label: {
//                        CertificateButtonView(certificate: certificate)
//                    }
//                }
                
                ForEach(certificateViewModel.certificates){ certificate in
                    NavigationLink{
                        CertificatePageView(certificateType: certificate.type, certificate: certificate)
                            .environmentObject(certificateViewModel)
                    } label: {
                        CertificateButtonView(certificate: certificate.type)
                    }
                }
        
                
                Spacer()
            }
            
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    NavigationStack {
        CertificateView()
    }
}
