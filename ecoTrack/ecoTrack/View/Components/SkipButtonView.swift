//
//  SkipButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 31/10/24.
//

import SwiftUI

struct SkipButtonView: View {
    var body: some View {
            ZStack {
                Rectangle()
                
                    .foregroundStyle(.white)
                    .frame( width: 169, height: 48)
                    .cornerRadius(8)
                
                
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .inset(by: 1)
                        .stroke(Color(.verdeClaro), lineWidth: 2))
                
                    Text("Pular ")
                        .foregroundStyle(.verdeClaro)
                        .font(.system(size: 14))
                        .bold()
                
            }
        }
    }


#Preview {
    SkipButtonView()
}
