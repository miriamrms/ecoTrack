//
//  OnBoardingFlow.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 01/11/24.
//

import SwiftUI

struct OnBoardingFlow: View {
    @State private var currentTab = 0
    @Binding var hasCompletedOnboarding: Bool
    @State private var isPresented: Bool = false
    
    var body: some View {
        TabView(selection: $currentTab) {
            OnBoarding1().tag(0)
            OnBoarding2().tag(1)
            OnBoarding3().tag(2)
        }
        .ignoresSafeArea(edges: .top)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
        HStack {
            Button {
                completeOnboarding()
            } label: {
                SkipButtonView()
            }
            
            Spacer()
           
            Button {
                if currentTab == 2 {
                    completeOnboarding()
                } else {
                    currentTab = currentTab + 1

        
//Estava na main
//         VStack {
            
//             TabView(selection: $currentTab) {
//                 OnBoarding1().tag(0)
//                 OnBoarding2().tag(1)
//                 OnBoarding3().tag(2)
//             }
            
//             .ignoresSafeArea(edges: .top)
//             .tabViewStyle(.page(indexDisplayMode: .always))
//             .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
//             HStack {
                
//                 Button {
//                     isPresented.toggle()
//                 } label: {
//                     SkipButtonView()
//                 }
                
//                 Spacer()
                
//                 Button {
                    
//                     if currentTab == 2 {
//                         isPresented.toggle()
//                     } else {
//                         currentTab = currentTab + 1
//                     }
//                 } label: {
//                     NextButtonView()
                    
                }
                
            }
        }
        .padding(.bottom, 40)
        .padding(.horizontal, 20)
//O comentado estava na main
//             .fullScreenCover(isPresented: $isPresented, content: {
//                // HomeView() 
//               //adicionar homeView novamente
//             })
// //            .padding(.bottom,40)
//             .padding(.horizontal,  20)
//         }

    }
    
    // Função para marcar onboard como concluido
    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        hasCompletedOnboarding = true // Atualiza o binding para que o ContentView navegue para a TabBarView
    }
}

#Preview {
    OnBoardingFlow(hasCompletedOnboarding: .constant(false))
}
