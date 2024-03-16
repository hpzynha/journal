//
//  EditJournalEntryView.swift
//  Journal
//
//  Created by Larissa Nogueira da Rocha on 16/3/2024.
//

import SwiftUI

struct EditJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var editingJournalEntry: JournalEntry
    @State var editMode = false
    var body: some View {
        if editMode{
            Form {
                TextField("Tittle", text: $editingJournalEntry.title)
                
                DatePicker("Date", selection: $editingJournalEntry.date,displayedComponents: .date)
                
                Text(String(repeating: "⭐️", count: Int(editingJournalEntry.rating)))
                Slider(value: $editingJournalEntry.rating, in: 1...5, step: 1)
                
                TextEditor(text: $editingJournalEntry.text)
                
            }
            .navigationTitle("Edit mode")
            Text("Edit mode")
                .toolbar{
                    Button("Delete"){
                        modelContext.delete(editingJournalEntry)
                        dismiss()
                    }
                    .foregroundColor(.red)
                    Button("Done"){
                        editMode = false
                    }
                    .bold()
                }
        }else {
            JournalEntryDetailView(detailJournalEntry: editingJournalEntry)
                .toolbar {
                    Button("Edit"){
                        editMode = true
                    }
                }
        }
    }
}

#Preview {
    NavigationStack{
        EditJournalEntryView(editingJournalEntry: JournalEntry(title: "ajdslakjdls", text: "ashdas", rating: 2.9, date: Date()))
    }
}
