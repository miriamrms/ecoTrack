//
//  LoginButton.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 30/10/24.
//

import SwiftUI
import SwiftData

struct LoginButton: View {
    @StateObject var companyViewModel = CompanyViewModel(dataSource: .shared)
    @Binding var isButtonValid: Bool
    @Binding var name: String
    @Binding var companySize: CompanySize
    @State var isShowingAlert: Bool = false
    @Binding var showHomePage: Bool
    var body: some View {
        Button {
            if isButtonValid {
                companyViewModel.addCompany(name: name, companySize: companySize)
                showHomePage.toggle()
            }
            else{
                isShowingAlert = true
            }
        } label: {
            HStack{
                Text("Continuar")
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(Color(isButtonValid ? "verdeClaro": "verdeClaroLight"))
            .foregroundStyle(Color.white)
            .font(.system(size: 16, weight: .bold))
            .cornerRadius(8)
            
        }
        .padding(.top, 29)
        .alert("Preencha as informações necessárias para seguir!", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel){}
        }
    }
}

#Preview {
//    LoginButton(isButtonValid: .constant(true))
}

