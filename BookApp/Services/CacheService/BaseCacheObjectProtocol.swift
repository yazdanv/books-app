//
//  BaseCacheProtocol.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation

protocol BaseCacheObjectProtocol {
    var invalidationTime: TimeInterval { get }
}

extension BaseCacheObjectProtocol {
    
    var isValid: Bool {
        return Date().timeIntervalSince1970 < invalidationTime
    }
    
}
