//
//  ToDoListView.swift
//  ToDoListSwift
//
//  Created by Oleh on 03.02.2025.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text("Show new view!")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ToDoListView()
}
