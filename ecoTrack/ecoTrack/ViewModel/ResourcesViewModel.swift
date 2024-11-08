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
    @Published var selectedResource: ResourceData?
//    @Published var water: ResourceData = ResourceData(type: .agua)
//    @Published var energy: ResourceData = ResourceData(type: .energia)
//    @Published var waste: ResourceData = ResourceData(type: .residuos)
    
    private let dataSource = SwiftDataService.shared
    
    init(dataSource: SwiftDataService) {
//        let dummyResources = ResourceData.dummyResources
//        for resource in dummyResources {
//            dataSource.addResource(resource)
//        }
        resources = dataSource.fetchResources()
        printResources()
    }
    
    func addSpending(resource: ResourceData, amount: Double, date: Date, price: Double){
        let spending = SpendData(resource: resource, data: date, price: price, amount: amount)
        dataSource.addSpendToResource(resource, spending)
    }
    
    func fetchResources(){
        resources = dataSource.fetchResources()
        printResources()
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
//    func changeSelectedResources(resourceType: Resources){
//        resources = dataSource.fetchResources()
//        for resource in resources {
//            if resource.type == resourceType {
//                selectedResource = resource
//            }
//            else{
//            
//            }
//        }
//    }
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
    
    
}

