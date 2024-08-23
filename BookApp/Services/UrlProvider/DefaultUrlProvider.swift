//
//  DefaultUrlProvider.swift
//
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation

struct DefaultUrlProvider: UrlProvider {
    
    init() {}
    
    func fullUrl(_ path: UrlPath) -> URL? {
        return url(path: path, baseUrl: UrlPath.baseUrl.rawValue)
    }

    func url(path: UrlPath, baseUrl: String) -> URL? {
        return URL(string: baseUrl + path.rawValue)
    }
    
}


