//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getRequest<T: Codable>(url: URL?) -> AnyPublisher<T, Error>?
}
