//
//  TabBarView.swift
//  ecoTrack
//
//  Created by Bruno Cezario on 30/10/24.
//

import SwiftUI

enum Tab: Int {
    case home = 0
    case certificado = 1
    case metas = 2
}

struct TabBarView: View {
    @StateObject private var companyViewModel = CompanyViewModel(dataSource: .shared)
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(.white))
    }
    
    @State var selectedTab: Tab = Tab.home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .environmentObject(companyViewModel)
                .tabItem {
                    Image("home")
                    Text("Início")
                }
                .tag(Tab.home)

            CertificateView()//ResourceView(resource: .agua)
                .tabItem {
                    Image("certificado")
                    Text("Certificado")
                }
                .tag(Tab.certificado)
            
            MetasView()
                .tabItem {
                    Image("metas")
                    Text("Metas")
                }
                .tag(Tab.metas)
        }
        .tint(.verdeClaro)
    }
}

#Preview {
    TabBarView()
}
