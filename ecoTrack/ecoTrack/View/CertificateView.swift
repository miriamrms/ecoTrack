//
//  SwiftUIView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 04/11/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        
        VStack{
            ZStack(alignment: .trailing) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 260)
                    .background(Color(.verdeClaro))
                
                Image("treeScreen")
                    .resizable()
                    .scaledToFit()
                  .frame(width: 135, height: 305)

            }
            
            
            Spacer()
        }

        .ignoresSafeArea()
        
        
    }
}

#Preview {
    SwiftUIView()
}
