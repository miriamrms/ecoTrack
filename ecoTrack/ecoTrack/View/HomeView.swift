//
//  HomeView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 24/10/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  
    @StateObject var resourceViewModel: ResourcesViewModel = ResourcesViewModel(dataSource: .shared)
    @EnvironmentObject var companyViewModel: CompanyViewModel
    @State var ShowModal = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    
                    Spacer().frame(maxHeight: 20)
                    
                    HStack {

                        Image(companyViewModel.company.companySize.icon)
                            .resizable()
                            .frame(width: 45, height: 45)
                        
                        VStack(alignment: .leading ){
                            Text(companyViewModel.company.name)
                                .font(.system(size: 19))
                                .foregroundStyle(.verdeClaro)
                                .bold()
                            
                            Text(companyViewModel.company.companySize.rawValue)
                                .font(.system(size: 14))
                                .foregroundStyle(.verdeClaro)
                                .fontWeight(.regular)
                        }
                        Spacer()

                        Button(action:  {
                            ShowModal.toggle()
                            
                        },label: {
                            Image("edit").padding(.top, 10)
                        })
                        
                    }.frame(maxWidth: .infinity)
                        .sheet(isPresented: $ShowModal) {
                            EditProfileView()
                        }
                    
                    Rectangle() // divisoria verde
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .foregroundStyle(.verdeClaro)
                    
                    Spacer().frame(maxHeight: 20)
                    
                    VStack(alignment: .leading) {
                        Text("Recursos")
                            .font(.system(size: 14))
                            .foregroundStyle(.azulEscuro)
                            .bold()
                        
                        Spacer().frame(height: 10)
                                                
                        ForEach(resourceViewModel.resources, id: \.id){ resource in
                            NavigationLink(destination: ResourceView(resourceType: resource.type, resource: resource).environmentObject(resourceViewModel)) {
                                ButtonView(resource: resource)
                                    .environmentObject(resourceViewModel)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                        Spacer().frame(height: 10)
                    }
                    
                }
             
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                Rectangle() // linha divisoria cinza 1
                    .frame(height: 5)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(red: 0.96, green: 0.96, blue: 0.96))
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 10)
                    
                    Text("Certificados em progresso")
                        .font(.system(size: 14))
                        .foregroundStyle(.azulEscuro)
                        .bold()
                    
                    Spacer().frame(height: 10)
                    
                    CertificateCardView()
                        .frame(maxWidth: .infinity)

                    
                    Spacer().frame(height: 10)
                }
                .padding(.horizontal, 20)
                
                Rectangle() // linha divisoria cinza 2
                    .frame(height: 5)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(red: 0.96, green: 0.96, blue: 0.96))
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 10)
                    
                    Text("Dicas sustentáveis")
                        .font(.system(size: 14))
                        .foregroundStyle(.azulEscuro)
                        .bold()
                    
                    Spacer().frame(height: 10)
                    
                    DicasButtonView().frame(maxWidth: .infinity)
                    
                }
                .padding(.horizontal, 20)
            }
        }
//        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    HomeView()
//}

