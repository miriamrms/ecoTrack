//
//  OnBoardingTestView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 01/11/24.
//

import SwiftUI

struct OnBoarding2: View {
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                Image("backgroundOnBoarding")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack(alignment: .center, spacing: 20){
                    Spacer()
                  
                    
                    Image("threeIcons")
                        .padding(.top)
                        .padding(.top)
                        //.padding(.bottom)
                    
                    Text("Acompanhe seus recursos")
                        .font(.system(size: 28))
                        .foregroundStyle(.verdeClaro)
                        .bold()
                    Text("Gerencie seus gastos e economia de \nrecursos naturais e materiais")
                        .font(.system(size: 16))
                        .foregroundStyle(.verdeClaro)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    OnBoarding2()
}
