//
//  NextButtonView.swift
//  ecoTrack
//
//  Created by Luciana Oliveira Almeda on 31/10/24.
//

import SwiftUI

struct NextButtonView: View {
    
    var body: some View {
        ZStack {
                    Rectangle()
                        .foregroundColor(Color("verdeClaro"))
                        .frame(width: 169, height: 48)
                        .cornerRadius(8)
                    
                    Text("Próximo")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .bold()
                }
//        Button {
//            
//        }
//        label: {
//            ZStack {
//                Rectangle()
//                
//                    .foregroundStyle(.verdeClaro)
//                    .frame( width: 169, height: 48)
//                    .cornerRadius(8)
//                
//                    Text("Próximo")
//                        .foregroundStyle(.white)
//                        .font(.system(size: 14))
//                        .bold()
//            }
//        }
    }
}

#Preview {
    NextButtonView()
}
