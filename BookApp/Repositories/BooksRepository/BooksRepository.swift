//
//  BooksRepository.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import Combine
import SwiftData

struct BooksRepository: RepositoryProtocol {
    typealias NetworkServiceType = BooksNetworkService
    typealias CacheServiceType = BooksCacheService
    
    var networkService: BooksNetworkService
    var cacheService: BooksCacheService
    
    init(networkService: BooksNetworkService, cacheService: BooksCacheService) {
        self.networkService = networkService
        self.cacheService = cacheService
    }
    
    func fetchBooks(completion: @escaping ([Book]) -> Void, onError: @escaping (Error?) -> Void) -> AnyCancellable? {
        let books = cacheService.books()
        if !books.isEmpty {
            completion(books)
        } else if let booksFromNetwork = networkService.getBooks() {
            return booksFromNetwork.receive(on: RunLoop.main).sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    onError(error)
                case .finished:
                    break
                }
            }, receiveValue: { object in
                let transformedBooks = self.cacheService.saveBooks(books: object.books)
                completion(transformedBooks)
            })
        }
        onError(nil)
        return nil
    }
}
