//
//  APIComponent.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/16/25.
//

import Foundation

typealias APIParameter = [String: Any]
typealias APIHeader = [String: String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkingError: Error {
    case encodingFailed(error: EncodingError)
    case decodingFailed(error: DecodingError)
    case invalidStatusCode(statusCode: Int)
    case requestFailed(error: URLError)
    case otherError(error: Error)
}
