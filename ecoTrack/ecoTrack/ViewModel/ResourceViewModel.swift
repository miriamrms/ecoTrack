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
    
    @Published var resources: [ResourceData]
    
    private let dataSource = SwiftDataService.shared
    
    init(dataSource: SwiftDataService) {
        
        let dummyResources = ResourceData.dummyResources
        for resource in dummyResources {
            dataSource.addResource(resource)
        }
        resources = dataSource.fetchResources()
    }
    
    func addSpending(type: Resources, amount: Double, date: Date, value: Double){
        
    }
    
}

extension ResourceData {
    static let dummyResources: [ResourceData] = [
        ResourceData(type: .agua),
        ResourceData(type: .energia),
        ResourceData(type: .residuos)
    ]
}

