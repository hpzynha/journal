//
//  ContentView.swift
//  Journal
//
//  Created by Larissa Nogueira da Rocha on 16/3/2024.
//

import SwiftUI
import SwiftData

struct JournalEntriesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort:\JournalEntry.date, order: .reverse) private var journalEntries: [JournalEntry]
    
    @State private var searchText = ""
    @State var showCreateView = false
    
    var filtredEntries: [JournalEntry] {
        if searchText.isEmpty{
            return journalEntries
        } else{
            return journalEntries.filter{$0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    var body: some View {
        NavigationStack{
            
            List(filtredEntries){ listedJournalEntry in
                NavigationLink(destination:
                                EditJournalEntryView(editingJournalEntry: listedJournalEntry))
                {
                    JournalEntryRowView(rowJournalEntry: listedJournalEntry)
                }
            }
            .navigationTitle("\(journalEntries.count) Journal Entries")
            .toolbar {
                Button(action: {
                    showCreateView = true
                }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntryView()
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    JournalEntriesListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}

