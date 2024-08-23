//
//  UrlProviderProtocol.swift
//  
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation

protocol UrlProvider {
    func fullUrl(_ path: UrlPath) -> URL?
    func url(path: UrlPath, baseUrl: String) -> URL?
}
