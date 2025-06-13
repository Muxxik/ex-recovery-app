//
//  ex_recovery_appApp.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import SwiftUI
import SwiftData
import Firebase
import Adapty


@main
struct ex_recovery_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var isOnboardingComplete = false
    @State private var isSubscribed = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Note.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
            Task {
                do {
                    if let url = Bundle.main.url(forResource: "fallback", withExtension: "json") {
                        try await Adapty.setFallback(fileURL: url)
                    }
                } catch {
                    print("❌ Ошибка при установке fallback paywall: \(error)")
                }
            }
        
        
            Adapty.activate("public_live_eUcrgM9c.2CVH0psVQ6Jp3gDYLqXH")
        
        
        }

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
