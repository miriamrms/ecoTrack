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
    
    func GeneralMediaAnalysis(_ resourceType: Resources) -> Double{
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
    
    func getPercent(_ resource: ResourceData) -> Double{
        let generalMedia = GeneralMediaAnalysis(resource.type)
        let percent: Double = resource.spendMediaPrice * 100 / generalMedia
        
        return percent
    }
    
    func isPercentGreaterThan(_ percent: Double) -> Bool{
         if percent > 100 {
            return true
        }
        else{
            return false
        }
    }
    
    func percentDiference(_ resource: ResourceData) -> Double{
        let percent = getPercent(resource)
        if isPercentGreaterThan(percent){
            return percent - 100
        }
        else{
            return 100 - percent
        }
    }
    
    func returnAnalysis(_ resource: ResourceData) -> String{
        let percent = getPercent(resource)
        let percentDiference = percentDiference(resource)
        if percentDiference == 0{
            return "Seu gasto de \(resource.type.rawValue) está na média de empresas do mesmo porte."
        }
        else{
            if isPercentGreaterThan(percent){
                return "Seu gasto de \(resource.type.rawValue) está \(String(format: "%.2f",percentDiference))% acima da média de empresas do mesmo porte."
            }
            else{
                return "Seu gasto de \(resource.type.rawValue) está \(String(format: "%.2f",percentDiference))% abaixo da média de empresas do mesmo porte."
            }
        }
        
    }
    
    func comparativeArrow(_ resource: ResourceData) -> String{
        let percent = getPercent(resource)
        let percentDiference = percentDiference(resource)
        if percentDiference == 0{
            return ""
        }
        else{
            if isPercentGreaterThan(percent){
                return "arrowtriangle.up.fill"
            }
            else{
                return "arrowtriangle.down.fill"
            }
        }
    }
    
}

