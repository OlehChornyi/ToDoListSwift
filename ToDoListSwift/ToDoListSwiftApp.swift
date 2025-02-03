//
//  ToDoListSwiftApp.swift
//  ToDoListSwift
//
//  Created by Oleh on 03.02.2025.
//

import SwiftUI
import SwiftData

@main
struct ToDoListSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    
    //Will allow to know where the data is saved on the device
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
