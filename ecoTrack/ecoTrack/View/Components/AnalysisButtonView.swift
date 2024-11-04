//
//  AnalysisButtonView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 01/11/24.
//

import SwiftUI

struct AnalysisButtonView: View {
    var analysis: Analysis
    var resource: Resources
    var valor: Double
   
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(resource.cor[1])
                .frame(maxHeight: 75)
                .padding(.leading,12)

            HStack{
                Image(analysis == .comparative ? resource.comparativeIcon : resource.mediaIcon)
                    
                VStack(alignment: .leading){
                    Text(analysis.rawValue)
                        .font(.system(size: 14, weight: .bold))
                    if analysis == .media{
                        Text("Porte da Empresa")
                            .font(.system(size: 9.7, weight: .regular))
                    }
                }
                Spacer()
                Image(systemName: valor < 0.0 ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
                    .font(.system(size: 23, weight: .bold))
                Text(String(format: "%.2f%%", valor))
                    .padding(.top, 23.5)
                    .padding(.bottom, 23.5)
                    .font(.system(size: 23, weight: .bold))
                    .padding(.trailing,20)
            }
            .foregroundStyle(Color.white)
            
        }
        .frame(maxWidth: 312, maxHeight: 75)
       
    }
}

#Preview {
    AnalysisButtonView(analysis: .comparative, resource: .agua, valor: 57)
}
