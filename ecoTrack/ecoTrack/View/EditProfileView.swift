//
//  EditProfileView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 05/11/24.
//

import SwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var companyViewModel: CompanyViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var companyName: String = ""
    @State var companySize: CompanySize?
    @State var showingAlert: Bool = false
    
    
    var body: some View {
        
        VStack{
            
            HStack(alignment: .center ){
                Image("edit")
                    .padding(.trailing, 14)
                
                Text("Editar Perfil")
                    .font(.system(size: 16))
                    .foregroundStyle(.verdeClaro)
                    .bold()
                
            }.padding(.top, 20)
                .frame(maxWidth: . infinity, alignment: .center)
            
            if companySize == nil {
                Image(companyViewModel.company.companySize.icon)
                    .frame(maxWidth: . infinity, alignment: .center)
                    .padding(.top)
                    .padding(.bottom, 45)
            }
            else {
                if let companySize{
                    Image(companySize.icon)
                        .frame(maxWidth: . infinity, alignment: .center)
                        .padding(.top)
                        .padding(.bottom, 45)
                    
                }
            }
            
            
            VStack(alignment: .center, spacing: 3) {
                Text("Nome da Empresa")
                    .foregroundStyle(.verdeClaro)
                    .font(.system(size: 16))
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading )
                
                ZStack{
                    RoundedRectangle(cornerRadius: 4 )
                        .stroke(.verdeClaro, lineWidth: 0.75)
                        .foregroundStyle(.white)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField(companyViewModel.company.name, text: $companyName)
                        .padding(.leading, 10)
                        .foregroundStyle(.verdeClaro)
                        .font(.system(size: 16))
                }
            }
            Spacer()
                .frame(height: 20)
            
            VStack(alignment: .center, spacing: 3) {
                Text("Porte da Empresa")
                    .font(.system(size: 16))
                    .foregroundStyle(.verdeClaro)
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading )
                
                DropDownView(selectedCompanySize: $companySize)
            }
            Spacer()
                .frame(height:90)
            
            
            Button {
                if companyName != "" && companySize != nil{
                    if let companySize {
                        companyViewModel.editCompany(name: companyName, companySize: companySize)
                    }
                    dismiss()
                }
                else {
                    showingAlert.toggle()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .cornerRadius(8)
                        .foregroundStyle(.verdeClaro)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                    Text("Salvar Edição")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Complete as Informações"), message: Text("Preencha todas as informações antes de continuar"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
            
        }
        .frame(maxHeight: .infinity)
        //.ignoresSafeArea(.all)
        .padding(15)
    }
}

#Preview {
    EditProfileView()
        .environmentObject(CompanyViewModel(dataSource: .shared))
}
