//
//  OnBoardingView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 30/10/24.
//

import SwiftUI


struct OnBoarding1: View {

    var body: some View {
            
        NavigationStack {
            
            ZStack {
                Image("backGreen")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20){

//                    HStack {
//                        Image("recicle")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//                    }
                    Spacer()
                    Image("recicle")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                   // Spacer()
                    Text("Bem vindos!")
                                .font(.system(size: 44))
                                .foregroundStyle(.verdeClaro)
                                .bold()
                    Text("Gerencie sua empresa rumo a \n sustentabilidade")
                                .font(.system(size: 16))
                                .foregroundStyle(.verdeClaro)
                                .multilineTextAlignment(.center)
                   // Spacer()
                    Spacer()
                        .frame(maxHeight: .infinity)
                    
                }
            }
        }.navigationBarBackButtonHidden(true)

    }
}

#Preview {
    OnBoarding1()
}

