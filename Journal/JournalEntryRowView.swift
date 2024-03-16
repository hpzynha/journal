//
//  JournalEntryRowView.swift
//  Journal
//
//  Created by Larissa Nogueira da Rocha on 16/3/2024.
//

import SwiftUI



struct JournalEntryRowView: View {
    
    let rowJournalEntry: JournalEntry
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(rowJournalEntry.title)
                    .bold()
                Text("-")
                Text(rowJournalEntry.text)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 1)
            HStack{
                Text(rowJournalEntry.date, style: .date)
                    .foregroundStyle(.secondary)
                Text(String(repeating: "⭐️", count: Int(rowJournalEntry.rating)))
            }
            .font(.caption)
        }
    }
}

#Preview {
    List {
        JournalEntryRowView(rowJournalEntry: JournalEntry(title: "A Great study day", text: "I spend 8 hours studying programming language, I spend 8 hours studying programming language, I spend 8 hours studying programming language", rating: 5, date: Date()))
    }
}
