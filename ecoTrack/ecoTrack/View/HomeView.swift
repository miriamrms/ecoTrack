//
//  HomeView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 24/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .foregroundStyle(.verdeEscuro)
                    .frame(width: 45, height: 45)
                    .cornerRadius(8)
                
                VStack{
                    Text("Nome empresa").bold()
                    Text("Segmento")
                    
                }
                
                
                
                
            }
            VStack{
                Text("Recursos")
            }
            
        }

    }
}

#Preview {
    HomeView()
}
