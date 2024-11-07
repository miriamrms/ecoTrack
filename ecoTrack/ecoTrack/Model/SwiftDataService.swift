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
        self.modelContainer = try! ModelContainer(for: CompanyData.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
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
}
