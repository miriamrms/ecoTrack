
//
//  LoginView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 30/10/24.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @State var companyName: String = ""
    @State var companySize: CompanySize?
    @Binding var hasCompletedLogin: Bool
    @State var saveCompanySize: CompanySize = .micro
    @State var isButtonActive: Bool = false
    @State var isShowingAlert: Bool = true
    @State var showHomePage: Bool = false
    @EnvironmentObject var companyViewModel: CompanyViewModel
    @State private var keyboardHeight: CGFloat = 0


    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    // MARK: Header
                    VStack(spacing: 20) {
                        Image("smallLeaf")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Nos conte mais sobre sua empresa")
                                .font(.system(size: 33, weight: .bold))
                            Text("Complete o cadastro com as informações da sua empresa")
                                .font(.system(size: 19, weight: .regular))
                        }
                        .foregroundStyle(Color.white)
                        .padding(20)
                    }
                    .frame(height: 480)
                    .background(Color("verdeClaro"))
                    .ignoresSafeArea()

                    // MARK: TextFields
                    VStack(alignment: .leading, spacing: 27) {
                        VStack(alignment: .leading) {
                            Text("Nome da Empresa")
                                .font(.system(size: 16, weight: .bold))
                            TextField("Nome da sua Empresa", text: $companyName)
                                .modifier(customViewModifier())
                        }

                        HStack {
                            Image(companySize == nil ? "portePequeno" : companySize!.icon)
                            VStack(alignment: .leading) {
                                Text("Porte da Empresa")
                                    .font(.system(size: 16, weight: .bold))
                                DropDownView(selectedCompanySize: $companySize)
                            }
                        }
                        .accentColor(.verdeClaro)

                        LoginButton(
                            isButtonValid: $isButtonActive,
                            name: $companyName,
                            companySize: $saveCompanySize,
                            showHomePage: $showHomePage
                        )
                    }
                    .padding(.horizontal, 15)
                    .padding(.top, 28)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .foregroundStyle(Color("verdeClaro"))
                    .padding(15)
                    .padding(.top, 28)
                    .onChange(of: ((companyName != "") && ((companySize) != nil))) { newValue in
                        isButtonActive = newValue
                        if let size = companySize {
                            saveCompanySize = size
                        }
                    }
                    .onChange(of: showHomePage) { newValue in
                        UserDefaults.standard.set(true, forKey: "hasCompletedLogin")
                        hasCompletedLogin = true
                    }
                }
                .padding(.bottom, keyboardHeight)
                .animation(.easeOut(duration: 0.3), value: keyboardHeight) //.animation(.easeOut(duration: 0.3))
                .onAppear {
                    // vai observar qdo o teclado aparece e desaparece
                    NotificationCenter.default.addObserver(
                        forName: UIResponder.keyboardWillShowNotification,
                        object: nil,
                        queue: .main
                    ) { notification in
                        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                            keyboardHeight = keyboardFrame.height - 60
                        }
                    }
                    NotificationCenter.default.addObserver(
                        forName: UIResponder.keyboardWillHideNotification,
                        object: nil,
                        queue: .main
                    ) { _ in
                        keyboardHeight = 0
                    }
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(self)
                }
            }
        }
    }
}

    
    // Função para marcar login como concluído
    //    private func completeLogin() {
    //        UserDefaults.standard.set(true, forKey: "hasCompletedLogin")
    //        hasCompletedLogin = true
    //    }

// #Preview {
//     LoginView(hasCompletedLogin: .constant(false))
// }
//#Preview {
//        LoginView()
//}


struct customViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(7.8)
            .background(Color.white)
            .cornerRadius(4)
            .padding(3)
            .foregroundColor(Color("verdeClaro"))
            .overlay(RoundedRectangle(cornerRadius: 4)
                .stroke(Color("verdeClaro"), lineWidth: 0.75))
            .font(.custom("SF Pro", size: 16))
    }
}
