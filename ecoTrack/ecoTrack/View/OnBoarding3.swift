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
            
            VStack{
                
                Image("certifIcon")
                
                
                    .resizable()
                    .scaledToFill()
                
                
                VStack {
                    VStack(alignment: .center){
                        Text("Encontre certificados")
                            .font(.system(size: 33))
                            .foregroundStyle(.verdeClaro)
                            .bold()
                            .padding(.bottom, 10)
                        
                        
                        Text("Planeje ações para alcançar certificados\n de sustentabilidade para sua empresa")
                            .font(.system(size: 16))
                            .foregroundStyle(.verdeClaro)
                            .multilineTextAlignment(.center)
                    }
                    //                .overlay {
                    //                    Rectangle()
                    //                        .stroke()
                    //                }
                    
                    Spacer()
                    
                    
                    
//                    HStack {
//                        NavigationLink(destination: HomeView()) {
//                            SkipButtonView()}
//                        Spacer()
//                        NavigationLink(destination: HomeView()) {
//                            NextButtonView ()}
//                        
//                    }.frame(width: 352, height: 48).padding(.bottom,60)
//                    
                    //                    .overlay {
                    //                        Rectangle()
                    //                            .stroke()
                    //                    }
                    
                    
                }
                //            .overlay {
                //                Rectangle()
                //                    .stroke()
                //                
                //            }
                
                
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoarding3()
}
