//  ApiService.swift
//  StreamCast

import Foundation
import Combine

class ApiService: ApiServiceProtocol {
    
    private var session: URLSession {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.waitsForConnectivity = true
        config.requestCachePolicy = .reloadRevalidatingCacheData
        return URLSession(configuration: config)
    }
    
    private func buildUrl(term: String, limit: Int) -> URL? {
    
        let queryItems = [
            URLQueryItem(name: "entity", value: "podcast"),
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]
        
        var components = URLComponents(url: ConfigParser.baseUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems

        return components?.url
        
    }
    
    func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError> {
        
        guard let url = buildUrl(term: term, limit: limit) else {
            return Fail(error: URLError(.badURL) ).eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: url)
            .retry(3)
            .map(\.data)
            .eraseToAnyPublisher()
        
    }
    
    func localPublisher(filename: String) -> AnyPublisher<Data, URLError> {
    
        guard let url = Bundle.main.url(forResource: filename, withExtension: ".json"),
              let data = try? Data(contentsOf: url)
              else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return CurrentValueSubject(data).eraseToAnyPublisher()
        
    }
    
}
