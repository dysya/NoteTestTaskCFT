//
//  MainController.swift
//  NoteTestTask
//
//  Created by dan4 on 16.03.2022.
//

import SwiftUI


final class MainCtrl: ObservableObject {
    @Published var allNotes:[NoteItem] = []
    @Published var newNote = ""
    
    private let notekey = "noteKey"
    
    func deleteNote(at offsets:IndexSet) {
        allNotes.remove(atOffsets: offsets)
        saveNotes()
    }
    
    func createNote() {
        allNotes.append(NoteItem(note: newNote))
        newNote.removeAll()
        saveNotes()
    }
    
    func saveNotes() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(allNotes), forKey: notekey)
    }
    
    func saveEdNotes() {
        if let noteData = UserDefaults.standard.data(forKey: notekey),
           let noteList = try? PropertyListDecoder().decode(Array<NoteItem>.self, from: noteData) {
                allNotes = noteList
        }
    }

    func loadNotes() {
        if let noteData = UserDefaults.standard.data(forKey: notekey),
           let noteList = try? PropertyListDecoder().decode(Array<NoteItem>.self, from: noteData) {
                allNotes = noteList
        }
        
        if allNotes.isEmpty {
            allNotes.append(NoteItem(note: "Read me \nДля создания заметки, введите в поле для ввода название заметки и нажмите клавишу '+', после этого, в списке появится название вашей заметки, нажав на него, вы получите доступ к редактированию заметки"))
        }
    }
}
