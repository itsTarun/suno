// EpisodeViewModel.swift
// StreamCast

import Foundation
import FeedKit

struct EpisodeViewModel: Identifiable {
    
    let id = UUID()
    var title, description: String
    var date: String
    var audioUrl: String
    var audio: Data?
    var audioLength: Double
    var audioSize: String
    var podcast: PodcastViewModel = .placeholder
    
    static var placeholder: EpisodeViewModel {
        createPlaceholder()
    }
    
    static var listPlaceholder: [EpisodeViewModel] {
        (0..<10).map { _ in
            createPlaceholder()
        }
    }
    
    private static func createPlaceholder() -> EpisodeViewModel {
        EpisodeViewModel(title: "Lorem ipsum",
                                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                                date: "20 sept 2020",
                                audio: "",
                                audioLength: 120,
                                audioSize: "13mb",
                                podcast: PodcastViewModel.placeholder)
    }
    
    internal init(title: String, description: String, date: String, audio: String, audioLength: Double, audioSize: String, podcast: PodcastViewModel) {
        self.title = title
        self.description = description
        self.date = date
        self.audioUrl = audio
        self.audioLength = audioLength
        self.audioSize = audioSize
        self.podcast = podcast
    }

    init(feedItem: RSSFeedItem, podcast: PodcastViewModel) {
        self.title = feedItem.title ?? ""
        self.description = feedItem.description ?? ""
        self.date = feedItem.pubDate.map { $0.format() } ?? ""
        self.audioUrl = feedItem.enclosure?.attributes?.url ?? ""
        self.audioLength = feedItem.iTunes?.iTunesDuration ?? 0
        
        self.audioSize = feedItem.enclosure?.attributes?.length.map {
            "\($0 / 1000000) mb"
        } ?? "0 mb"
        
        self.podcast = podcast
    }
}
