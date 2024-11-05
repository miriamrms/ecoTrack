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
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(.white))
        
    }
    @State var selectedTab: Tab = Tab.home
    
    var body: some View {
        TabView {
            //Text("Home")
            VStack {
                HomeView()
//                HomeView()
            }
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
            
            MetasView()
                .tabItem {
                    Image("metas")
                    Text("Metas")
                }
        }
        .tabViewStyle(.tabBarOnly)
        .tint(.verdeClaro)
        .toolbarBackground(Color.red, for: .tabBar)
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
//        .onAppear() {
//                                UITabBar.appearance().barTintColor = .red
//                                   }
    }
}


#Preview {
    TabBarView()
}
