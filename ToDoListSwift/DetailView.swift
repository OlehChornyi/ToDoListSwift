//
//  DetailView.swift
//  ToDoListSwift
//
//  Created by Oleh on 03.02.2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Button("Get Back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DetailView()
}
