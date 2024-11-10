//
//  ViewModel.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 05/11/24.
//
import Foundation
import SwiftUI
import SwiftData

class ResourcesViewModel: ObservableObject{
    
    @Published var resources: [ResourceData] = []
    @Published var company: CompanyData

    private let dataSource = SwiftDataService.shared
    
    init(dataSource: SwiftDataService) {
        resources = dataSource.fetchResources()
        company = dataSource.fetchCompany().first!
    }
    
    func addSpending(resource: ResourceData, amount: Double, date: Date, price: Double){
        let spending = SpendData(resource: resource, data: date, price: price, amount: amount)
        dataSource.addSpendToResource(resource, spending)
    }
    
    func fetchResources(){
        resources = dataSource.fetchResources()
    }
    
    func updateMedia(_ resource: ResourceData){
        dataSource.updateMedia(resource)
    }
    
    func printResources(){
        print("teste \(resources)")
        for resource in resources {
            print(resource.type.rawValue)
        }
    }
    
    func fetchResourcesTeste() -> [ResourceData]{
        return dataSource.fetchResources()
    }

    func findSpendData(resoucesType: Resources) -> [SpendData]{
        let resources = dataSource.fetchResources()
        var spending: [SpendData] = []
        for resource in resources {
            if resource.type == resoucesType {
                spending = resource.history
            }
            else {
                spending = []            }
        }
        return spending
    }
    
    func MediaAnalysis(_ resourceType: Resources) -> Double{
        if company.companySize == .micro {
            return resourceType.microEmpresa
        }
        else if company.companySize == .pequena{
            return resourceType.pequenaEmpresa
        }
        else{
            return resourceType.mediaEmpresa
        }
    }
    
}

