//
//  CheckboxView.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 06/11/24.
//

import SwiftUI

struct CheckboxView: View {
    @EnvironmentObject var certificateViewModel: CertificateViewModel
    
    var action: Action
    var certificate: CertificateData
    
    @State var isChecked: Bool = false
    
    var body: some View {
        
        
        Button {
            certificateViewModel.updateAction(action)
            certificateViewModel.updateProgress(certificate)
        } //botao de recursos preenchido
        
        label: {
            if !action.isVerified{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 25, height: 25)
                    .cornerRadius(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .inset(by: 0.81)
                            .stroke(Color(.azulEscuro), lineWidth: 1.62)
                    )
            } else {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 25, height: 25)
                  .cornerRadius(2)
                  .overlay(
                    RoundedRectangle(cornerRadius: 2)
                      .inset(by: 0.81)
                      .stroke(Color(red: 0.46, green: 0.53, blue: 0.17), lineWidth: 1.62)
                  )
                  .background(
                                  Image("check")
                                      .frame(width: 14, height: 9.71035)
                                )
                
                
            }
        }
        
        
    }
}

#Preview {
    CheckboxView(action: Action(name: "sajhs"), certificate: CertificateData(type: .iso, actions: [Action(name: "")]))
        .environmentObject(CertificateViewModel(dataSource: .shared))
}
