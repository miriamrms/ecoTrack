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
    var body: some Scene {
        WindowGroup {
            LoginView(companyViewModel: CompanyViewModel(dataSource: .shared))
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
