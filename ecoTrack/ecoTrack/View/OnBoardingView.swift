//
//  OnBoardingView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 30/10/24.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack {
            
            VStack {
                
                Image("backGreen")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
            }
            //            VStack(alignment: .leading) {
            HStack {
                
                Image("recicle")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.frame( maxWidth:.infinity)
            //            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    OnBoardingView()
}
