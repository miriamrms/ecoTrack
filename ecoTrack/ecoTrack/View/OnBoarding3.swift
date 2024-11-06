//
//  OnBoardinLastView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 01/11/24.
//

import SwiftUI

struct OnBoarding3: View {
    var body: some View {
        
        
        NavigationStack{
            
            
            
            ZStack {
                Image("backgroundOnBoarding")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20){
                    
                    Spacer()
                    
                    Image("certificateIcon1")
                        //.padding()
                        .padding(.top)
                        .padding(.top)
                        .padding(.top)
                    
               Text("Encontre certificados")
                        .font(.system(size: 33))
                        .foregroundStyle(.verdeClaro)
                        .bold()
                        .padding(.top)
        
                            
                    Text("Planeje ações para alcançar certificados\n de sustentabilidade para sua empresa")
                        .font(.system(size: 16))
                        .foregroundStyle(.verdeClaro)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoarding3()
}
