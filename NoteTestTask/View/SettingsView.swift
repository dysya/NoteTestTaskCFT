//
//  SettingsView.swift
//  NoteTestTask
//
//  Created by dan4 on 16.03.2022.
//

import SwiftUI

struct SettingsView: View {
    @Binding var colorScheme: ColorScheme?
    var body: some View {
        VStack {
            Picker(selection: $colorScheme, label: Text("Appearance")) {
                Text("System Default")
                    .tag(Optional<ColorScheme>.none)
                
                Text("Light")
                    .tag(Optional<ColorScheme>.some(ColorScheme.light))
                
                Text("Dark")
                    .tag(Optional<ColorScheme>.some(ColorScheme.dark))
                
            }.buttonStyle(.bordered)
            Spacer()
        }
    }
}
