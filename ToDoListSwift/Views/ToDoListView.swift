//
//  ToDoListView.swift
//  ToDoListSwift
//
//  Created by Oleh on 03.02.2025.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos: [ToDo]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    VStack (alignment: .leading){
                        HStack {
                            Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDo.isCompleted.toggle()
                                    guard let _ = try? modelContext.save() else {return}
                                }
                            
                            NavigationLink {
                                DetailView(toDo: toDo)
                            } label: {
                                Text(toDo.item)
                            }
                        }
                        .font(.title2)
                        
                        HStack {
                            Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                                .foregroundStyle(.secondary)
                            
                            if toDo.reminderIsOn {
                                Image(systemName: "calendar.badge.clock")
                                    .symbolRenderingMode(.multicolor)
                            }
                        }
                    }
                    //                    .swipeActions {
                    //                        Button("Delete", role: .destructive) {
                    //                            modelContext.delete(toDo)
                    //                            guard let _ = try? modelContext.save() else {
                    //                                print("Error: Save after 🤬 didn't work")
                    //                                return
                    //                            }
                    //                        }
                    //                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach({modelContext.delete(toDos[$0])})
                    guard let _ = try? modelContext.save() else {
                        print("Error: Save after 🤬 didn't work")
                        return
                    }
                }
            }
            .navigationTitle("To Do List")
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
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
        .modelContainer(ToDo.preview)
}
