//
//  ContentView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 23/10/24.
//

//
//  ContentView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 23/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var hasCompletedOnboarding: Bool
    @State private var hasCompletedLogin: Bool
    @StateObject var companyViewModel: CompanyViewModel = CompanyViewModel(dataSource: .shared)
    
    init() {
        // Verifica se o usuario já completou o onboarding e o login
        let completedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
        let completedLogin = UserDefaults.standard.bool(forKey: "hasCompletedLogin")
        _hasCompletedOnboarding = State(initialValue: completedOnboarding)
        _hasCompletedLogin = State(initialValue: completedLogin)
    }
    
    var body: some View {
        NavigationStack {
            if hasCompletedOnboarding {
                if hasCompletedLogin {
                    TabBarView() // Navega para a TabBarView se o onboarding e o login já foram concluídos
                } else {
                    LoginView(hasCompletedLogin: $hasCompletedLogin)
                }
            } else {
                OnBoardingFlow(hasCompletedOnboarding: $hasCompletedOnboarding)
            }
        }
    }
}


#Preview {
    ContentView()
}

