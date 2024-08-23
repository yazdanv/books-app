//
//  ContentView.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import SwiftUI
import SwiftData

import SwiftUI

struct BooksListView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: BooksListViewModel = BooksListViewModel()
    let isFavorites: Bool
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredBooks(searchText: searchText)) { book in
                    NavigationLink(destination: BookDetailView(book: book, toggleFavorite: viewModel.toggleFavorite)) {
                        BookRowView(book: book)
                    }
                }
            }
            .navigationTitle(isFavorites ? "Favorites" : "Books")
            .searchable(text: $searchText)
            .onAppear {
                viewModel.setModelContext(modelContext: modelContext)
                viewModel.getBooks(isFavorites: isFavorites)
            }
        }
        .alert(isPresented: Binding(get: {
            viewModel.error != nil
        }, set: { _ in  viewModel.error = nil })) {
            Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    BooksListView(isFavorites: false)
        .modelContainer(for: Book.self, inMemory: true)
}
