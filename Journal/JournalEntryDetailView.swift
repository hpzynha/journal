//
//  JournalEntryDetailView.swift
//  Journal
//
//  Created by Larissa Nogueira da Rocha on 16/3/2024.
//

import SwiftUI
import SwiftData

struct JournalEntryDetailView: View {
    
    let detailJournalEntry: JournalEntry
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text(detailJournalEntry.date, style: .date)
                        .bold()
                    Text("-")
                    Text(String(repeating: "⭐️", count: Int(detailJournalEntry.rating)))
                    Spacer()
                }
                .padding(.bottom)
                
                Text(detailJournalEntry.text)
            }
            .padding()
            
        }
        .navigationTitle(detailJournalEntry.title)
    }
    
    #Preview {
        JournalEntriesListView()
            .modelContainer(for: JournalEntry.self, inMemory: true)
    }
}
