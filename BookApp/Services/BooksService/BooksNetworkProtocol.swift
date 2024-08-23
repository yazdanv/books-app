//
//  BooksNetworkProtocol.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import Combine

protocol BooksNetworkProtocol: BaseNetworkServiceProtocol {
    
    func getBooks() -> AnyPublisher<any BooksProtocol, Error>?

}
