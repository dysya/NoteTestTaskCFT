//
//  ContentView.swift
//  NoteTestTask
//
//  Created by dan4 on 16.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var mainCtrl = MainCtrl()
    @State var myColorScheme: ColorScheme?
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add the name of new note....", text: $mainCtrl.newNote)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: mainCtrl.createNote) {
                        Image(systemName: "plus")
                    }
                    .disabled(mainCtrl.newNote.isEmpty)
                    .padding()
                }
                .padding()
                    
                List {
                    ForEach($mainCtrl.allNotes) { $noteItem in
                        NavigationLink(
                            destination: DetailView(item: $noteItem)
                                            .onDisappear(perform: mainCtrl.saveNotes)
                        ) {
                            Text((((noteItem.note).split(separator: "\n")).first) ?? "")
                        }
                    }.onDelete(perform: mainCtrl.deleteNote)
                }
            }
            .navigationBarItems(leading: Text("Dysssyas notes").font(.title2).bold(), trailing: NavigationLink("⚙", destination: SettingsView(colorScheme: $myColorScheme)))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: mainCtrl.loadNotes)
        .preferredColorScheme(myColorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
