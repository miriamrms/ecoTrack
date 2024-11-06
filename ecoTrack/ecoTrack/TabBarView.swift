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
       
    @State var selectedTab: Tab = Tab.home
    
    var body: some View {
        TabView {
            //Text("Home")
            HomeView(companyViewModel: CompanyViewModel(dataSource: .shared))
                .tabItem {
                    Image("home")
                    Text("Início")
                    // .font()
                }

            Text("Certificados")
                .tabItem {
                    Image("certificado")
                    Text("Certificado")
                }
            
            Text("Metas")
                .tabItem {
                    Image("metas")
                    Text("Metas")
                }
        }
        .tint(.verdeClaro)
    }
}

#Preview {
    TabBarView()
}
