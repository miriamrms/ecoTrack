//
//  ViewModel.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 05/11/24.
//
import Foundation
import SwiftUI
import SwiftData

class ResourceViewModel: ObservableObject{
    
    @Published var resources: [ResourceData] = []
//    @Published var water: ResourceData = ResourceData(type: .agua)
//    @Published var energy: ResourceData = ResourceData(type: .energia)
//    @Published var waste: ResourceData = ResourceData(type: .residuos)
    
    private let dataSource = SwiftDataService.shared
    
    init(dataSource: SwiftDataService) {
        let dummyResources = ResourceData.dummyResources
        for resource in dummyResources {
            dataSource.addResource(resource)
        }
        resources = dataSource.fetchResources()
    }
    
    func addSpending(type: Resources, amount: Double, date: Date, price: Double){
        let resource = resources.filter {
            $0.type == type
        }.first!
        let spending = SpendData(data: date, price: price, amount: amount)
        dataSource.addSpendToResource(resource, spending)
    }
    
}

extension ResourceData {
    static let dummyResources: [ResourceData] = [
        ResourceData(type: .agua),
        ResourceData(type: .energia),
        ResourceData(type: .residuos)
    ]
}

