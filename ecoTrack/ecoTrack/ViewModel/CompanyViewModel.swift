//
//  ViewModel.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 05/11/24.
//
import Foundation
import SwiftUI
import SwiftData

class CompanyViewModel: ObservableObject{
    
    @Published var company: CompanyData
    
    private let dataSource = SwiftDataService.shared
    
    
    init(dataSource: SwiftDataService) {
       self.company = CompanyData(name: "", companySize: .micro) // Inicialização padrão
       if let savedCompany = dataSource.fetchCompany().first, company.name.isEmpty {
           self.company = savedCompany
       }
    }
    
    func addCompany(name: String, companySize: CompanySize) {
        if company.name.isEmpty {
         let companyToSave = CompanyData(name: name, companySize: companySize)
         dataSource.addCompany(companyToSave)
         company = companyToSave
        }
     }
 
    func editCompany(name: String, companySize: CompanySize) {
        dataSource.editCompany(name, companySize)
    }
    
    func addFixedResources(){
        let dummyResources = ResourceData.dummyResources
        for resource in dummyResources {
            dataSource.addResource(resource)
        }
    }
    
    func addFixedCertificates(){
        let fixedCertificates = CertificateData.fixedCertificates
        for certificate in fixedCertificates {
            dataSource.addCertificate(certificate)
        }
    }

}

extension ResourceData {
    static let dummyResources: [ResourceData] = [
        ResourceData(type: .agua),
        ResourceData(type: .energia),
        ResourceData(type: .residuos)
    ]
}


