//
//  resourceGoals.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 04/11/24.
//

import SwiftUI

struct ResourceGoalsView: View {
    var resource: Resources
    var body: some View {
        VStack(spacing: -5){
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [resource.cor[1], .verdeClaro]), startPoint: .leading, endPoint: .trailing))
                    .frame(height: 60)
                    .cornerRadius(8, corners: [.topLeft, .topRight])
                HStack(spacing: 13){
                    Image(resource.singleIcon)
                        .padding(.leading, 15)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                        .font(.system(size: 13.3, weight: .bold))
                        .padding(.top, 15.5)
                        .padding(.bottom, 15.5)
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .font(.system(size: 26, weight: .bold))
                    }
                    .padding(.trailing, 15)
                }
                .foregroundStyle(Color.white)
            }
            ZStack {
                UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 8, bottomTrailingRadius: 8, topTrailingRadius: 0, style: .circular)
                    .fill(Color.white)
                    .overlay(
                            UnevenRectangle()
                                .stroke(.verdeClaro, lineWidth: 1)
                                )
                    .frame(height: 151)
                
                VStack {
                    VStack(alignment: .leading, spacing: 4){
                        Text("Média")
                            .font(.system(size: 10, weight: .regular))
                        HStack{
                            Text("Investimento Inicial")
                            Spacer()
                            Text("A partir de R$ 400")
                        }
                        .font(.system(size: 13.32, weight: .bold))
                    }
                    .foregroundStyle(Color.verdeClaro)
                    .padding(15)
                    Divider()
                        .frame(height: 1)
                        .overlay(.verdeClaro)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Média")
                            .font(.system(size: 10, weight: .regular))
                        HStack{
                            Text("Economia a longo prazo")
                            Spacer()
                            Text("Até -10% de gasto mensal")
                        }
                        .font(.system(size: 13.32, weight: .bold))
                    }
                    .foregroundStyle(Color.verdeClaro)
                    .padding(15)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 15)
        .padding(.trailing, 15)
    }
}

struct UnevenRectangle: Shape {
    var cornerRadius: CGFloat = 8.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
      
        path.move(to: CGPoint(x: rect.minX+1, y: rect.minY)) // ponto 1
        path.addLine(to: CGPoint(x: rect.maxX-1, y: rect.minY)) // ponto 4
        // Arredondar o canto inferior direito
        path.addLine(to: CGPoint(x: rect.maxX-1, y: rect.maxY - cornerRadius)) // ponto 5
        path.addArc(center: CGPoint(x: rect.maxX-1 - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false) // canto inferior direito

        // Arredondar o canto inferior esquerdo
        path.addLine(to: CGPoint(x: rect.minX+1 + cornerRadius, y: rect.maxY)) // ponto 6
        path.addArc(center: CGPoint(x: rect.minX+1 + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false) // canto inferior esquerdo

        path.addLine(to: CGPoint(x: rect.minX+1, y: rect.minY + 20)) // ponto 1 novamente
        path.closeSubpath() // Fecha o caminho
        
        return path
    }
}
#Preview {
    ResourceGoalsView(resource: .agua)
}
