//
//  BaseAPIConfiguration.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/16/25.
//

import Foundation

class BaseAPIConfiguration: APIConfigurable {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
}

enum APIRequestConfiguration {
    case login
    
    var config: APIRequestConfigurable {
        switch self {
        case .login:
            return AuthenticationRequest()
        }
    }
}
