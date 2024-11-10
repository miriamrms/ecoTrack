//
//  AnalysisButtonView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 01/11/24.
//

import SwiftUI

struct AnalysisButtonView: View {
    @EnvironmentObject var resourceViewModel: ResourcesViewModel
    
    var analysis: Analysis
    var resource: Resources
    
    @State var showingAlert: Bool = false
    var valor: Double
   
    var body: some View {
        
        Button {
            showingAlert.toggle()
        } label: {
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
                    if analysis == .comparative{
                        Image(systemName: valor < 0.0 ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
                            .font(.system(size: 23, weight: .bold))
                        Text(String(format: "%.2f%%", valor))
                            .padding(.top, 23.5)
                            .padding(.bottom, 23.5)
                            .font(.system(size: 23, weight: .bold))
                            .padding(.trailing,20)
                    }
                    else{
                        Text(String(format: "R$%.2f", resourceViewModel.MediaAnalysis(resource)))
                            .padding(.top, 23.5)
                            .padding(.bottom, 23.5)
                            .font(.system(size: 23, weight: .bold))
                            .padding(.trailing,20)
                    }
                   
                }
                .foregroundStyle(Color.white)
                
            }
            .frame(maxWidth: 312, maxHeight: 75)
            .padding(.leading,7)
        }
        .alert(isPresented: $showingAlert) {
            if analysis == .comparative{
                Alert(title: Text(analysis.rawValue), message: Text("Seu gasto de energia está 11% acima da média de empresas do mesmo porte."), dismissButton: .default(Text("OK")))
            }
            else{
                Alert(title: Text(analysis.rawValue), message: Text("A média mensal de gastos com \(resource.rawValue) de \(resourceViewModel.company.companySize.group) é R$ \(String(format: "R$%.2f", resourceViewModel.MediaAnalysis(resource)))"), dismissButton: .default(Text("OK")))
            }
        }

        
       
    }
}

//#Preview {
//    AnalysisButtonView(analysis: .media, resource: .agua, valor: 57)
//}
