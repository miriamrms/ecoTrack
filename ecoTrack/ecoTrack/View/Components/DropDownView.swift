//
//  DropDownView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 30/10/24.
//
import SwiftUI

struct DropDownView: View{
    @Binding var selectedCompanySize: CompanySize?
    @State var dropdownLabel: String = "Porte da sua Empresa"
    
    var body: some View{
        VStack{
            Menu{
                ForEach(CompanySize.allCases){ companySize in
                    Button(companySize.rawValue){
                        changePort(companySize)
                    }
                }
            } label: {
                HStack(){
                    Text(dropdownLabel)
                        .padding(10.8)
                    Spacer()
                    Image("arrow")
                        .padding(10.8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.verdeClaro)
                .overlay( ///apply a rounded border
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.verdeClaro, lineWidth: 0.75)
                        .font(.custom("SF Pro", size: 16))
                )
            }
        }
    }
    func changePort(_ port: CompanySize) {
        selectedCompanySize = port
        dropdownLabel = port.rawValue
    }
}



#Preview(){
    DropDownView(selectedCompanySize: .constant(.media))
}
