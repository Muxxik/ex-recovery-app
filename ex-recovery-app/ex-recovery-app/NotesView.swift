//
//  NotesView.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 13.06.2025.
//

import Foundation
import SwiftUI
import SwiftData

struct NotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note]
    @State private var newNoteText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Новая заметка", text: $newNoteText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Сохранить") {
                    addNote()
                }
                .buttonStyle(.borderedProminent)

                List {
                    ForEach(notes.sorted(by: { $0.date > $1.date })) { note in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(note.text)
                                .font(.body)
                            Text(note.date.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: deleteNotes)
                }
            }
            .navigationTitle("Заметки")
        }
    }

    private func addNote() {
        guard !newNoteText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let note = Note(text: newNoteText)
        modelContext.insert(note)
        newNoteText = ""
    }

    private func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(notes[index])
        }
    }
}
