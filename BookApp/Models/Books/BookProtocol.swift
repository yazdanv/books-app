//
//  BookProtocol.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation


// Sample book
//{
//  "title": "To Kill a Mockingbird",
//  "author": "Harper Lee",
//  "genre": "Fiction",
//  "published_year": 1960,
//  "ISBN": "978-0-06-112008-4",
//  "image_url": "https://images-na.ssl-images-amazon.com/images/I/81OthjkJBuL.jpg"
//}

protocol BookProtocol {
    var title: String { get }
    var author: String { get }
    var genre: String { get }
    var publishedYear: Int { get }
    var isbn: String { get }
    var imageUrl: String { get }
    var desc: String { get }
}
