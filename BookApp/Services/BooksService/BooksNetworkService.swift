//
//  BooksNetworkService.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import Combine

struct BooksNetworkService: BooksNetworkProtocol {
    let urlProvider: any UrlProvider
    let networkService: any NetworkServiceProtocol
    
    
    init(networkService: NetworkServiceProtocol = DefaultNetworkService(), urlProvider: UrlProvider = DefaultUrlProvider()) {
        self.urlProvider = urlProvider
        self.networkService = networkService
    }
    
    func getBooks() -> AnyPublisher<any BooksProtocol, Error>? {
        guard let publisher: AnyPublisher<BooksNetworkObject, Error> =
                networkService.getRequest(url: urlProvider.fullUrl(.books)) else { return nil }
        return publisher
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
}
