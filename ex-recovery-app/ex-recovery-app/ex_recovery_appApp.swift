//
//  ex_recovery_appApp.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct ex_recovery_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var isOnboardingComplete = false
    @State private var isSubscribed = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
                    if !isOnboardingComplete {
                        OnboardingView(isOnboardingComplete: $isOnboardingComplete)
                    } else if !isSubscribed {
                        PaywallView(isSubscribed: $isSubscribed)
                    } else {
                        MainView()
                    }
                }
        .modelContainer(sharedModelContainer)
    }
}
