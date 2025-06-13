//
//  Note.swift
//  ex-recovery-app
//
//  Created by Максим Колбин on 13.06.2025.
//

import Foundation
import SwiftData

@Model
class Note {
    var text: String
    var date: Date

    init(text: String, date: Date = .now) {
        self.text = text
        self.date = date
    }
}

