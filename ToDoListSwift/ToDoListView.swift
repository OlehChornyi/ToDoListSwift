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
    @State private var sheetIsPresented = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        sheetIsPresented.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
