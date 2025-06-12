//
//  OnboardingView.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import Foundation
import SwiftUI
import FirebaseAnalytics

struct OnboardingView: View {
    @Binding var isOnboardingComplete: Bool

    var body: some View {
        VStack(spacing: 24) {
            Text("Ты на верном пути 💪")
                .font(.title)

            Button("Продолжить") {
                Analytics.logEvent("onboarding_completed", parameters: nil)
                isOnboardingComplete = true
            }
        }
        .onAppear {
            Analytics.logEvent("onboarding_started", parameters: nil)
        }
    }
}

