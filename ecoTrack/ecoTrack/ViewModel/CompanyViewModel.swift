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
    
    @Published var company: CompanyData?
//    @Published var companyTeste: [CompanyData]
    
    private let dataSource: SwiftDataService
    
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        self.company = dataSource.fetchCompany().first
//        company = (dataSource.fetchCompany()).first
//        companyTeste = dataSource.fetchCompany()
    }
    
    func addCompany(name: String, companySize: CompanySize) {
        let companyToSave = CompanyData(name: name, companySize: companySize)
        dataSource.addCompany(companyToSave)
        company = dataSource.fetchCompany().first
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

