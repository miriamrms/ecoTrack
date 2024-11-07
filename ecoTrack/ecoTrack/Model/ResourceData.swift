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
    var data: Date
    var price: Double
    var amount: Double
    
    init(data: Date, price: Double, amount: Double) {
        id = UUID().uuidString
        self.data = data
        self.price = price
        self.amount = amount
    }
}
