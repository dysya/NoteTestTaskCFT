//
//  MainModel.swift
//  NoteTestTask
//
//  Created by dan4 on 16.03.2022.
//

import Foundation

struct NoteItem: Codable, Identifiable {
    var id = UUID()
    var note: String
}
