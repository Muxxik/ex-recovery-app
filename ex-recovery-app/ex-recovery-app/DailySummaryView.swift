//
//  DailySummaryView.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 12.06.2025.
//

import Foundation
import SwiftUI
import SwiftData

struct DailySummaryView: View {
    var daysWithoutContact = 15

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                // Top bar
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("Daily Summary")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)

                // Progress bar
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Days without contact")
                            .font(.subheadline)
                        Spacer()
                        Text("\(daysWithoutContact)")
                            .font(.subheadline)
                    }

                    ProgressView(value: Double(daysWithoutContact), total: 30)
                        .accentColor(Color(".orange")) // или .orange
                }
                .padding(.horizontal)

                // Motivation
                VStack(alignment: .leading, spacing: 8) {
                    Text("Motivation")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("""
    Each day is a fresh start to nurture your independence and self-love. Embrace this journey of growth and self-discovery with open arms.
    """)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)

                // Focus
                VStack(alignment: .leading, spacing: 12) {
                    Text("Today’s Focus")
                        .font(.title3)
                        .fontWeight(.bold)

                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Reflection")
                                .font(.caption)
                                .foregroundColor(.brown)

                            Text("Journal your feelings")
                                .font(.body)
                                .fontWeight(.bold)

                            Text("""
    Take a moment to reflect on your emotions and jot them down. This practice can help you identify patterns and triggers, fostering self-awareness.
    """)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image("journal") // добавь картинку journal в Assets
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding(.horizontal)
                
                NavigationLink(destination: NotesView()) {
                    Text("Открыть заметки")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()

                // Tab bar-заглушка
                HStack {
                    Spacer()
                    Image(systemName: "house.fill")
                    Text("Home").font(.caption)
                    Spacer()
                    Image(systemName: "chart.bar")
                    Text("Progress").font(.caption)
                    Spacer()
                    Image(systemName: "person.2")
                    Text("Community").font(.caption)
                    Spacer()
                    Image(systemName: "person")
                    Text("Profile").font(.caption)
                    Spacer()
                }
                .foregroundColor(.brown)
                .padding(.vertical, 12)
                .background(Color(UIColor.systemGray6))
            }
        }
    }
}

#Preview {
    DailySummaryView()
}
