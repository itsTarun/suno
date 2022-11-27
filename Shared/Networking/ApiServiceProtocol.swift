//  ApiServiceProtocol.swift
//  StreamCast

import Foundation
import Combine

public protocol ApiServiceProtocol: class {
    func remotePublisher(term: String, limit: Int) -> AnyPublisher<Data, URLError>
    func localPublisher(filename: String) -> AnyPublisher<Data, URLError>
}
