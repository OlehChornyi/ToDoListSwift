//
//  ToDo.swift
//  ToDoListSwift
//
//  Created by Oleh on 03.02.2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Date.now + 60*60*24
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
}

extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //Add mock data
        container.mainContext.insert(ToDo(item: "Create a mess", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "This is real", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Create an order", reminderIsOn: true, dueDate: Date.now + 60*60*48, notes: "This is real too", isCompleted: false))
        
        return container
    }
}
