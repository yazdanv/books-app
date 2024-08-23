//
//  BookRowView.swift
//  BookApp
//
//  Created by Yazdan Vakili on 23/08/2024.
//

import SwiftUI

struct BookRowView: View {
    @State var book: Book
    
    var body: some View {
        HStack {
            if let url = URL(string: book.imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                } placeholder: {
                    Image(systemName: "book.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                        .opacity(0.3)
                }
            }
            

            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("\(book.genre), \(book.publishedYear)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    BookRowView(book: Book.mock)
}

