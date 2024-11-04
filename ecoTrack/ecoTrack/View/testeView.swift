////
////  testeView.swift
////  ecoTrack
////
////  Created by Miriam Mendes on 30/10/24.
////
//
//import SwiftUI
//
//struct testeView: View {
//    @State private var nomeEmpresa: String = ""
//    @State private var porteEmpresa: CompanySize = CompanySize.micro
//    @State var companySize: CompanySize?
//    @State var isButtonValid: Bool = false
//    var body: some View {
//        VStack(spacing: 0){
//            ZStack(){
//                Color.verdeClaro
//                VStack(alignment: .leading){
//                    Image("leaf1")
//                        .resizable()
//                        .scaledToFill()
//                    VStack(alignment: .leading, spacing: 10){
//                        Text("Nos conte mais sobre sua empresa")
//                            .font(.system(size: 33, weight: .bold))
//                        Text("Complete o cadastro com as informações da sua empresa")
//                            .font(.system(size: 19, weight: .regular))
//                    }
//                    .padding(.leading, 20)
//                    .padding(.trailing, 20)
//                    .padding(.bottom, 10)
//                        
//                }
//                .foregroundStyle(Color.white)
//                
//
//            }
//            ZStack{
//                Color.white
//                VStack(alignment: .leading){
//                    VStack(alignment: .leading){
//                        Text("Nome da Empresa")
//                            .font(.system(size: 16, weight: .bold))
//                        TextField("Nome da sua Empresa",
//                                  text: $nomeEmpresa)
//                        .modifier(customViewModifier())
//                    }
//                    HStack{
//                        Image("portePequeno")
//                        VStack(alignment: .leading){
//                            Text("Porte da Empresa")
//                                .font(.system(size: 16, weight: .bold))
//                            DropDownView(selectedCompanySize: $companySize)
//                        }
//                    }
//                    .accentColor(.verdeClaro)
//                    LoginButton(isButtonValid: $isButtonValid)
//                }
//                .foregroundStyle(Color.verdeClaro)
//                .padding(20)
//            }
//        }
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    testeView()
//}
//
//
//struct customViewModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(7.8)
//            .background(Color.white)
//            .cornerRadius(4)
//            .padding(3)
//            .foregroundColor(Color("verdeClaro"))
//            .overlay(RoundedRectangle(cornerRadius: 4)
//                .stroke(Color("verdeClaro"), lineWidth: 0.75))
//            .font(.custom("SF Pro", size: 16))
//    }
//}
