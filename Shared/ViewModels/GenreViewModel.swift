// GenreViewModel.swift
// StreamCast

import Foundation

struct GenreViewModel: Identifiable, Hashable {
    var id: Int
    var name: String
    
    static let placeholder = createPlaceholder(id: 1)
    
    static var listPlaceholders: [GenreViewModel] {
        (0..<15).map {
            createPlaceholder(id: $0)
        }
    }
    
    private static func createPlaceholder(id: Int) -> GenreViewModel {
        GenreViewModel( Genre(id: id, name: "Technology") )
    }

    init(_ genre: Genre) {
        self.id = genre.id
        self.name = genre.name
    }
}
