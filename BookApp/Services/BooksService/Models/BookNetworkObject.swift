//
//  BookNetworkObject.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation


struct BookNetworkObject: BookProtocol, Codable {
    var title: String
    var author: String
    var genre: String
    var publishedYear: Int
    var isbn: String
    var imageUrl: String
    var desc: String
}
