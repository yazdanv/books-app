//
//  BooksCacheService.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import SwiftData

struct BooksCacheService: BaseCacheServiceProtocol {
    
    var modelContext: ModelContext
    
    func buildAndSaveBook(book: BookProtocol, invalidationTime: TimeInterval) -> Book {
        let newBookObject = Book.fromBookProtocol(book: book, invalidationTime: invalidationTime)
        modelContext.insert(newBookObject)
        try? modelContext.save()
        return newBookObject
    }
    
    func saveBooks(books: [BookProtocol]) -> [Book] {
        return books.map { book in
            let invalidationTime = TimeInterval().advanced(by: 1000)
            
            let bookTitle = book.title
            let fetchDescriptor = FetchDescriptor<Book>(
                predicate: #Predicate<Book> { _book in
                    _book.title == bookTitle
                }
            )
            
            
            if let savedBook = try? modelContext.fetch(fetchDescriptor).first {
                savedBook.updateFromBookProtocol(book: book, invalidationTime: invalidationTime)
                guard let _ = try? modelContext.save() else {
                    return buildAndSaveBook(book: book, invalidationTime: invalidationTime)
                }
                return savedBook
            } else {
                return buildAndSaveBook(book: book, invalidationTime: invalidationTime)
            }
        }
    }
    
    func books() -> [Book] {
        guard let books = try? modelContext.fetch(FetchDescriptor<Book>(predicate: nil)) else { return [] }
        for book in books { if !book.isValid { return [] } }
        return books
    }
    
    func favoriteBooks() -> [Book] {
        let fetchDescriptor = FetchDescriptor<Book>(
            predicate: #Predicate<Book> { _book in
                _book.isFavorite == true
            }
        )
        let books = try? modelContext.fetch(fetchDescriptor)
        return books ?? []
    }
    
    
    func save() {
        try? modelContext.save()
    }
    
    func toggleFavorite(book: Book) -> Book {
        book.toggleFavorite()
        self.save()
        return book
    }
}
