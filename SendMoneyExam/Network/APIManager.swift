//
//  APIManager.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/16/25.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func request(for api: APIRequestConfiguration) async throws -> Data {
        let config = api.config
        var urlComponents = URLComponents(string: config.baseURL + config.endpoint)
        
        config.parameters?.forEach {
            urlComponents?.queryItems?.append(URLQueryItem(name: $0.key, value: $0.value as? String))
        }
        
        guard let url = urlComponents?.url else {
            throw NetworkingError.requestFailed(error: URLError(.badURL))
        }
        
        var request = URLRequest(url: url)
        
        config.headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return data
    }
}
