//
//  BookDetailView.swift
//  BookApp
//
//  Created by Yazdan Vakili on 23/08/2024.
//
import SwiftUI

struct BookDetailView: View {
    @State var book: Book
    let toggleFavorite: (Book) -> Book
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Book Image
                if let url = URL(string: book.imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200, maxHeight: 300)
                            .cornerRadius(10)
                    } placeholder: {
                        Image(systemName: "book.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200, maxHeight: 300)
                            .cornerRadius(10)
                            .opacity(0.3)
                            .transition(.opacity)
                    }
                }
                
                // Book Title and Favorite Button
                HStack {
                    Text("by \(book.author)")
                        .font(.title2)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeInOut) {
                            book = toggleFavorite(book)
                        }
                    }) {
                        Image(systemName: book.isFavorite ? "star.fill" : "star")
                            .foregroundColor(book.isFavorite ? .yellow : .gray)
                            .font(.title2)
                    }
                }
                
                // Author

                
                // Genre and Published Year
                Text("\(book.genre) • \(book.publishedYear)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // ISBN
                Text("ISBN: \(book.isbn)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
                
                // Description
                Text(book.desc)
                    .font(.body)
                    .padding(.top, 16)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(book.title)
    }
}

#Preview {
    BookDetailView(book: Book.mock, toggleFavorite: { book in
        var book = book
        book.toggleFavorite()
        return book
    })
}
