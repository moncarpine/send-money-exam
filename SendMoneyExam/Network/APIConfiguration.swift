//
//  APIConfiguration.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/16/25.
//

import Foundation

// Protocol for base API configurations.
protocol APIConfigurable {
    var baseURL: String { get }
    var headers: APIHeader? { get }
}

extension APIConfigurable {
    var headers: APIHeader? {
        return nil
    }
}

// Protocol for request-level API configurations.
protocol APIRequestConfigurable: APIConfigurable {
    var endpoint: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: APIParameter? { get }
}

extension APIRequestConfigurable {
    var parameters: APIParameter? {
        return nil
    }
}
