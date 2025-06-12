//
//  MainView.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import Foundation
import SwiftUI
import FirebaseAnalytics

struct MainView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("День 1. Дыши глубже.")
                .font(.title)

            Button("Я завершил") {
                Analytics.logEvent("completed_day", parameters: [
                    "day_number": 1,
                    "success": true
                ])
            }
        }
    }
}
