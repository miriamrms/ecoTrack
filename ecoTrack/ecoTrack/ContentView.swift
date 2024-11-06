//
//  ContentView.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 23/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var companyViewModel: CompanyViewModel = CompanyViewModel(dataSource: .shared)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
    }
}

#Preview {
    OnBoarding1()
}
