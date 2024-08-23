//
//  BooksNetworkObject.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation

struct BooksNetworkObject: BooksProtocol, Codable {
    typealias BookItem = BookNetworkObject
    var books: [BookItem]
}
