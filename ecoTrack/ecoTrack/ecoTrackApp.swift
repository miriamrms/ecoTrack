//
//  ecoTrackApp.swift
//  ecoTrack
//
//  Created by Miriam Mendes on 23/10/24.
//

import SwiftUI
import SwiftData

@main
struct ecoTrackApp: App {
    let container: ModelContainer
    @StateObject private var companyViewModel = CompanyViewModel(dataSource: .shared)
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //.environmentObject(MetasViewModel)
            LoginView(hasCompletedLogin: .constant(false))
                .environmentObject(companyViewModel)
        }
        .modelContainer(container)
    }
    init() {
        do {
            container = try ModelContainer(for: CompanyData.self)
        } catch {
            fatalError("Failed to create ModelContainer for Movie.")
        }
    }
}
