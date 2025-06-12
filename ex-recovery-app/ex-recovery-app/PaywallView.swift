//
//  PaywallView.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import Foundation
import SwiftUI
import FirebaseAnalytics

struct PaywallView: View {
    @Binding var isSubscribed: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Получите доступ ко всем возможностям 🔓")
                .font(.title)

            Button("Начать триал") {
                Analytics.logEvent("tapped_start_trial", parameters: [
                    "source": "onboarding"
                ])

                // Имитация успешной подписки (в будущем — через RevenueCat)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    Analytics.logEvent("trial_started", parameters: [
                        "product_id": "trial_weekly"
                    ])
                    isSubscribed = true
                }
            }
        }
        .onAppear {
            Analytics.logEvent("viewed_paywall", parameters: [
                "source": "onboarding"
            ])
        }
    }
}
