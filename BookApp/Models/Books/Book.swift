//
//  Item.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import SwiftData



@Model
final class Book: BookProtocol, BaseCacheObjectProtocol {
    var invalidationTime: TimeInterval
    var title: String
    var author: String
    var genre: String
    var publishedYear: Int
    var isbn: String
    var imageUrl: String
    var desc: String
    
    var isFavorite: Bool
    
    init(invalidationTime: TimeInterval, title: String, author: String, genre: String, publishedYear: Int, isbn: String, imageUrl: String, desc: String) {
        self.invalidationTime = invalidationTime
        self.title = title
        self.author = author
        self.genre = genre
        self.publishedYear = publishedYear
        self.isbn = isbn
        self.imageUrl = imageUrl
        self.desc = desc
        self.isFavorite = false
    }
}

// MARK: - Extension - Toggle Favorite
extension Book {
    func toggleFavorite() {
        self.isFavorite = !self.isFavorite
    }
}


// MARK: - Extension - Build From BookProtocol
extension Book {
    func updateFromBookProtocol(book: BookProtocol, invalidationTime: TimeInterval? = nil) {
        self.title = book.title
        self.author = book.author
        self.genre = book.genre
        self.publishedYear = book.publishedYear
        self.isbn = book.isbn
        self.imageUrl = book.imageUrl
        self.desc = book.desc
        if let invalidationTime = invalidationTime {
            self.invalidationTime = invalidationTime
        }
    }
    
    static func fromBookProtocol(book: BookProtocol, invalidationTime: TimeInterval) -> Book {
        return Book(invalidationTime: invalidationTime, title: book.title, author: book.author, genre: book.genre, publishedYear: book.publishedYear, isbn: book.isbn, imageUrl: book.imageUrl, desc: book.desc)
    }
}

// MARK: - Extension - Mock
extension Book {
    static var mock: Book {
        return Book(invalidationTime: 0, title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", publishedYear: 1960, isbn: "978-0-06-112008-4", imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81OthjkJBuL.jpg", desc: "A novel set in the American South during the 1930s, addressing racial injustice and the destruction of innocence. The story is narrated by Scout")
    }
}
