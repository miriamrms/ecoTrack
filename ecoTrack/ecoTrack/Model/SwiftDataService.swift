//
//  SwiftDataService.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 05/11/24.
//

import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        // Change isStoredInMemoryOnly to false if you would like to see the data persistance after kill/exit the app
        self.modelContainer = try! ModelContainer(for: ResourceData.self, CompanyData.self, SpendData.self, CertificateData.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    //MARK: Company Functions
    
    func fetchCompany() -> [CompanyData] {
        do {
            return try modelContext.fetch(FetchDescriptor<CompanyData>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addCompany(_ company: CompanyData) {
        modelContext.insert(company)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func editCompany(_ companyName: String, _ companySize: CompanySize) {
        let company = fetchCompany().first!
        company.name = companyName
        company.companySize = companySize
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //MARK: Resources Functions
    
    func fetchResources() -> [ResourceData] {
        do {
            return try modelContext.fetch(FetchDescriptor<ResourceData>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addResource(_ resource: ResourceData) {
        modelContext.insert(resource)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateMedia(_ resource: ResourceData) {
        var sumPrice: Double = 0
        var sumAmount: Double = 0
        var count: Int = 0
        for spending in resource.history {
            sumPrice += spending.price
            sumAmount += spending.amount
            count += 1
        }
        resource.spendMediaPrice = sumPrice / Double(count)
        resource.spendMediaAmount = sumAmount / Double(count)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addSpendToResource(_ resource: ResourceData, _ spend: SpendData) {
        resource.history.append(spend)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //MARK: Certificates Function
    
    func fetchCertificates() -> [CertificateData]{
        do {
            return try modelContext.fetch(FetchDescriptor<CertificateData>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addCertificate(_ certificate: CertificateData) {
        modelContext.insert(certificate)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateAction(_ action: Action) {
        action.isVerified.toggle()
        modelContext.insert(action)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateProgress(_ progress: Double, _ certificate: CertificateData) {
        certificate.progress = progress
        modelContext.insert(certificate)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}
