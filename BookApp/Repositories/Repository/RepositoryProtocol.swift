//
//  RepositoryProtocol.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import SwiftData

protocol RepositoryProtocol {
    associatedtype NetworkServiceType: BaseNetworkServiceProtocol
    associatedtype CacheServiceType: BaseCacheServiceProtocol
   
    var networkService: NetworkServiceType { get }
    var cacheService: CacheServiceType { get }
}
