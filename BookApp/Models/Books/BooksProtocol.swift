//
//  BooksProtocol.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation

protocol BooksProtocol {
    associatedtype BookItem: BookProtocol
    var books: [BookItem] { get }
}
