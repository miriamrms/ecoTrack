//
//  CertificatePageView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 05/11/24.
//

import SwiftUI


//MARK: - INTERFACE
struct CertificatePageView: View {
    
    
    @State var certificateProgressPage: Double = 100
    @State private var isSheetWhatPresented = false
    @State private var isSheetBenefitsPresented = false
    
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
                    Button {
                        isSheetWhatPresented = true
                    }
                    
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
                    
                    Button {
                        isSheetBenefitsPresented = true
                        
                    }
                    
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
        
        .sheet(isPresented: $isSheetWhatPresented) {
            // A View que será exibida no sheet
            SheetWhatView(isPresented: $isSheetWhatPresented, certificate:certificate)
        }
        
        .sheet(isPresented: $isSheetBenefitsPresented) {
            SheetBenefitsView(isPresented: $isSheetBenefitsPresented, certificate:certificate)
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

//MARK: - SHEET O QUE É

struct SheetWhatView: View {
    
    @Binding var isPresented: Bool
    
    var certificate: Certificate
    
    var body: some View {
        VStack {
            
            Image("sealQuestion")
                .resizable()
                .frame(width: 44.22004, height: 44.21999)
            
            Text("O que é?")
                .font(
                    Font.system(size: 28)
                        .weight(.bold)
                )
                .foregroundColor(Color(.azulEscuro))
            
            
            
            Text(certificate.whatIs)
                .font(Font.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.azulEscuro))
                .frame(width: .infinity, alignment: .top)
                .padding(.top, 10)
                .padding(.leading, 40)
                .padding(.trailing, 40)
            
            Button {
                isPresented = false
            } label: {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.azulEscuro)

                    Text("Voltar")
                        .font(
                            Font.system(size: 16)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                }
                .frame(width: .infinity, height: 40)
                .padding(.top, 30)
                .padding(.leading, 40)
                .padding(.trailing, 40)
            }
            
            
        }
    }
}

//MARK: - SHEET BENEFICIOS

struct SheetBenefitsView: View {
    
    @Binding var isPresented: Bool
    
    var certificate: Certificate
    
    var body: some View {
        VStack {
            Image("stars")
                .resizable()
                .frame(width: 44.22004, height: 44.21999)
            
            Text("Benefícios")
                .font(
                    Font.system(size: 28)
                        .weight(.bold)
                )
                .foregroundColor(Color(.azulEscuro))
            
            VStack(alignment: .leading) {
                ForEach(certificate.benefits, id: \.self){ benefits in
                    HStack{
                        Image("star")
                        
                        Text(benefits)
                            .font(Font.system(size: 16))
                            .foregroundColor(.azulEscuro)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 30)
                    
                }
            }
            .padding(.top, 20)
            .padding(.leading, 40)
            .padding(.trailing, 40)
            .frame(maxWidth: .infinity)
            
            Button {
                isPresented = false
            } label: {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.azulEscuro)

                    Text("Voltar")
                        .font(
                            Font.system(size: 16)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                }
                .frame(width: .infinity, height: 40)
                .padding(.leading, 40)
                .padding(.trailing, 40)
            }
            
            
        }
    }
}

#Preview {
    CertificatePageView(certificate: .seloverde)
}
