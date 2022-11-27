// Genre.swift
// StreamCast

import Foundation

struct GenreList: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}
