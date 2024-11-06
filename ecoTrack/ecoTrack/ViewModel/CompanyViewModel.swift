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
        
        
    }
    
//    func deleteCompany(_ company: CompanyData) {
//        modelContext.delete(company)
//        fetchData()
//    }
    
//    func fetchData() {
//        do {
//            let descriptor = FetchDescriptor<CompanyData>(sortBy: [SortDescriptor(\CompanyData.name)])
//            let fetchItens: [CompanyData] = try modelContext.fetch(descriptor)
//
//            company = fetchItens.first
//        } catch {
//            print("Fetch failed")
//        }
//    }

}
