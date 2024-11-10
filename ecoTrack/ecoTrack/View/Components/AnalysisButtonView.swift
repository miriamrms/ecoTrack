//
//  AnalysisButtonView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 01/11/24.
//

import SwiftUI

struct AnalysisButtonView: View {
    @EnvironmentObject var resourceViewModel: ResourcesViewModel
    
    @State var showingAlert: Bool = false
    
    var analysis: Analysis
    var resource: ResourceData
    
    
    var percent: Double {
        resourceViewModel.percentDiference(resource)
    }
    
    var body: some View {
        
        Button {
            showingAlert.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(resource.type.cor[1])
                    .frame(maxHeight: 75)
                    .padding(.leading,12)
                
                HStack{
                    Image(analysis == .comparative ? resource.type.comparativeIcon : resource.type.mediaIcon)
                    
                    VStack(alignment: .leading){
                        Text(analysis.rawValue)
                            .font(.system(size: 14, weight: .bold))
                        if analysis == .media{
                            Text(resourceViewModel.company.companySize.group)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 9.7, weight: .regular))
                            
                        }
                    }
                    .frame(maxWidth: 100)
                    Spacer()
                    if analysis == .comparative{
                        Image(systemName: resourceViewModel.comparativeArrow(resource))
                            .font(.system(size: 23, weight: .bold))
                        Text(String(format: "%.2f%%", percent))
                            .padding(.top, 23.5)
                            .padding(.bottom, 23.5)
                            .font(.system(size: 23, weight: .bold))
                            .padding(.trailing,20)
                    }
                    else{
                        Text(String(format: "R$%.2f", resourceViewModel.GeneralMediaAnalysis(resource.type)))
                            .padding(.top, 23.5)
                            .padding(.bottom, 23.5)
                            .font(.system(size: 19, weight: .bold))
                            .padding(.trailing,20)
                            .frame(minWidth: 105)
                        
                    }
                    
                }
                .foregroundStyle(Color.white)
                
            }
            .frame(minWidth: 312, maxHeight: 75)
            .padding(.leading,7)
        }
        .alert(isPresented: $showingAlert) {
            if analysis == .comparative{
                Alert(title: Text(analysis.rawValue), message: Text(resourceViewModel.returnAnalysis(resource)), dismissButton: .default(Text("OK")))
            }
            else{
                Alert(title: Text(analysis.rawValue), message: Text("A média mensal de gastos com \(resource.type.rawValue) de \(resourceViewModel.company.companySize.group) é R$ \(String(format: "R$%.2f", resourceViewModel.GeneralMediaAnalysis(resource.type)))"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

//#Preview {
//    AnalysisButtonView(analysis: .media, resource: .agua, valor: 57)
//}
