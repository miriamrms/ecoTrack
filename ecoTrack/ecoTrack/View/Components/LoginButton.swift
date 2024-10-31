//
//  LoginButton.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 30/10/24.
//

import SwiftUI

struct LoginButton: View {
    @Binding var isButtonValid: Bool
    @State var isShowingAlert: Bool = false
    var body: some View {
        Button {
            if isButtonValid {
    
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
            .background(Color(isButtonValid ? "verdeClaro": "verdeClaro-1"))
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
    LoginButton(isButtonValid: .constant(true))
}

