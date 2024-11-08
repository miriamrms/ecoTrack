//
//  CertificatePageView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 05/11/24.
//

import SwiftUI


enum Certificate: String, CaseIterable {
    case iso = "ISO 1401 "
    case seloverde = "Selo Verde"
    
    var description: String {
        switch self {
        case .iso:
            return "Gestão ambielntal eficaz para empresas sustentáveis"
        case .seloverde: return "Reconhecimento por práticas empresariais sustentáveis"
        }
    }
    var goals: [String] {
        switch self {
        case .iso:
            return ["Economize agua","Reduzir despesas","Reduzir impacto ambiental"]
        case .seloverde:
            return ["",""]
        }
    }
    
    var link: String {
        switch self {
        case .iso:
            return "https://certificacaoiso.com.br/iso-14001-2/"
        case .seloverde:
            return "https://sebrae.com.br/sites/PortalSebrae/artigos/voce-sabe-o-que-e-selo-verde,a031949fca8e4810VgnVCM100000d701210aRCRD#:~:text=O%20selo%20verde%20é%20uma,como%20certificação%20verde%20ou%20ecosselo."
        }
    }
    
}

//MARK: - INTERFACE
struct CertificatePageView: View {
    
    @State var certificateProgressPage: Double = 100
    var certificate: Certificate
    
    var body: some View {
        
        ScrollView {
            VStack{
                HStack{
                    Image("certificateBlue")
                        .frame(width: 27, height: 27)
                    
                    
                    Text("Certificados")
                        .font(
                            Font.system(size: 19)
                                .weight(.bold)
                        )
                        .foregroundColor(.azulEscuroDark)
                    
                }
                .padding(.top, 23)
                
                Image("treeCertificate")
                    .frame(width: 122.99963, height: 123)
                    .padding(.top, 34)
                
                
                Text(certificate.rawValue)
                    .font(
                        Font.system(size: 23)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.azulEscuroDark))
                
                //MARK: - PROGRESS BAR
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
                            .frame(width: CGFloat(certificateProgressPage), height: 10)
                            .background(Color(.verdeClaro))
                            .cornerRadius(25)
                        
                    }
                    
                    Text("70%")
                        .font(
                            Font.system(size: 14)
                                .weight(.bold)
                        )
                        .foregroundColor(.verdeClaro)
                }
                
                //MARK: - BOTOES
                HStack(spacing: 67){
                    
                    //O QUE É?
                    Button {}
                    
                    label: {
                        VStack{
                            Image("sealQuestion")
                                .frame(width: 40.00005, height: 40)
                            
                            Text("O que é?")
                                .font(Font.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(.azulEscuroDark))
                                .frame(alignment: .center)
                                .padding(.top, 7)
                            
                        }
                        .frame(width: 72)
                    }
                    
                    //BENEFÍCIOS
                    
                    Button {}
                    
                    label: {
                        VStack{
                            Image("stars")
                                .frame(width: 40.00005, height: 40)
                            
                            Text("Benefícios")
                                .font(Font.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(.azulEscuroDark))
                                .frame(alignment: .center)
                                .padding(.top, 7)
                            
                        }
                        .frame(width: 72)
                    }
                    
                    //SAIBA MAIS
                    Button {
                        openLinkCert(certificate: certificate)
                    } label: {
                        VStack{
                            Image("3dots")
                                .frame(width: 40.00005, height: 40)
                            
                            Text("Saiba Mais")
                                .font(Font.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(.azulEscuroDark))
                                .frame(alignment: .center)
                                .padding(.top, 7)
                            
                        }
                        .frame(width: 72)
                    }
                    
                }
                .padding(.top, 40)
                
                HStack{
                    Text("Ações para obter o Selo Verde:")
                        .font(
                            Font.system(size: 14)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(.azulEscuroLight))
                    
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity)
                
                ForEach(certificate.goals, id: \.self){ goal in
                    VStack {
                        HStack {
                            CheckboxView()
                            Text(goal)
                                .font(Font.system(size: 14))
                                .foregroundColor(Color(red: 0.04, green: 0.16, blue: 0.29))
                                .frame(width: 314, height: 40, alignment: .leading)
                            
                            
                            Spacer()
                        }
                        .padding(.leading, 25)
                        .frame(maxWidth: .infinity)
                    }
                    
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 353, height: 1)
                      .background(.black)
                }
                .padding(.top, 2)
                
                
            }
        }
        
        
        
        
        
        
        Spacer()
        
    }
    
    //MARK: - FUNCOES
    
    //Abrir Link
    func openLinkCert(certificate: Certificate) {
        if let url = URL(string: certificate.link) {
            UIApplication.shared.open(url)
        } else {
            print("URL inválida.")
        }
    }
    
    
    
    
}


#Preview {
    CertificatePageView(certificate: .iso)
}
