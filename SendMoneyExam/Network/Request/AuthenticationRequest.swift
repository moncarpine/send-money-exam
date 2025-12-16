//
//  AuthenticationRequest.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/16/25.
//

import Foundation

class AuthenticationRequest: BaseAPIConfiguration, APIRequestConfigurable {
    var endpoint: String {
        return "/users/1"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
