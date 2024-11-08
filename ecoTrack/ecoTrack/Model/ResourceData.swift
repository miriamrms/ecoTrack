//
//  ResourcesData.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 06/11/24.
//

import SwiftData
import Foundation

@Model
class ResourceData: Identifiable {
    var id: String
    var type: Resources
    var history: [SpendData]
    var spendMedia: Double
    
    init(type: Resources, history: [SpendData] = [], spendMedia: Double = 0.0) {
        id = UUID().uuidString
        self.type = type
        self.history = history
        self.spendMedia = spendMedia
    }
}
@Model
class SpendData: Identifiable {
    var id: String
    var resource: ResourceData?
    var data: Date
    var price: Double
    var amount: Double
    
    init(resource: ResourceData, data: Date, price: Double, amount: Double) {
        id = UUID().uuidString
        self.resource = resource
        self.data = data
        self.price = price
        self.amount = amount
    }
}
