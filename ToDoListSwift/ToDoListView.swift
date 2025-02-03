//
//  ToDoListView.swift
//  ToDoListSwift
//
//  Created by Oleh on 03.02.2025.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn",
                 "Build",
                 "Change",
                 "Bring"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationTitle("To Do List")
            .listStyle(.plain)
        }
    }
}

#Preview {
    ToDoListView()
}
