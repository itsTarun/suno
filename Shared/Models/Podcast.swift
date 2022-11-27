// Podcast.swift
// StreamCast

import Foundation

struct PodcastList: Codable {
    let resultCount: Int
    let results: [Podcast]
}

struct Podcast: Codable {
    var artistID: Int?
    var collectionID, trackID: Int
    var description: String?
    var artistName, collectionName, trackName: String?
    var feedURL: String?
    var artworkUrl30, artworkUrl60, artworkUrl100: String?
    var releaseDate: String?
    var collectionExplicitness, trackExplicitness: String?
    var trackCount: Int?
    var country, primaryGenreName: String?
    var contentAdvisoryRating: String?
    var artworkUrl600: String?
    var genres: [String]?
    
    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName
        case feedURL = "feedUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100
        case releaseDate, collectionExplicitness, trackExplicitness, trackCount, country, primaryGenreName, contentAdvisoryRating, artworkUrl600
        case genres
    }

}
