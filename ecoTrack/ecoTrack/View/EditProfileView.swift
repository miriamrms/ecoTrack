//
//  EditProfileView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 05/11/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var companyName: String = ""
    @State var companySize: CompanySize?
    
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
            
            Image("porteMicro")
                .frame(maxWidth: . infinity, alignment: .center)
                .padding(.top)
                .padding(.bottom, 45)
            
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
                    TextField("Nome da empresa", text: $companyName)
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
            Spacer()
            
        }
        .frame(maxHeight: .infinity)
       //.ignoresSafeArea(.all)
        .padding(15)
    }
}

#Preview {
    EditProfileView()
}
