//
//  BooksListViewModel.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import Combine
import SwiftData

class BooksListViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    @Published var error: Error? = nil
    
    var booksRepository: BooksRepository?
    var cacheService: BooksCacheService?
    
    func setModelContext(modelContext: ModelContext) {
        cacheService = BooksCacheService(modelContext: modelContext)
        self.booksRepository = BooksRepository(networkService: BooksNetworkService(), cacheService: cacheService!)
    }
    
    private func setBooks(books: [Book]) {
        self.books = books
    }
    
    private func setError(error: Error?) {
        self.error = error
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] _ in
            if (self?.error != nil) {self?.error = nil}
        }
    }
    
    func filteredBooks(searchText: String) -> [Book] {
        return searchText != "" ? self.books.filter { book in
            book.title.lowercased().contains(searchText.lowercased()) || book.author.lowercased().contains(searchText.lowercased())
        } : books
    }
    
    func getBooks(isFavorites: Bool) {
        if (isFavorites) {
            self.setBooks(books: self.cacheService?.favoriteBooks() ?? [])
        } else {
            booksRepository?.fetchBooks(completion: {[weak self] books in
                self?.setBooks(books: books)
            }, onError: { [weak self] error in
                self?.setBooks(books: [])
                self?.setError(error: error)
            })?.store(in: &cancellables)
        }
    }
    
    func toggleFavorite(book: Book) -> Book {
        return cacheService?.toggleFavorite(book: book) ?? book
    }
    
    private var cancellables: Set<AnyCancellable> = []
}
