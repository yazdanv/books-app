//
//  BaseNetworkServiceProtocol.swift
//
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation

protocol BaseNetworkServiceProtocol {
    var urlProvider: UrlProvider { get }
    var networkService: NetworkServiceProtocol { get }
}
