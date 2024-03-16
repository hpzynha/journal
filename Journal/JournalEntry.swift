//
//  Item.swift
//  Journal
//
//  Created by Larissa Nogueira da Rocha on 16/3/2024.
//

import Foundation
import SwiftData

@Model
final class JournalEntry {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
