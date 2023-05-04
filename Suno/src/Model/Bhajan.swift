//
//  Bhajan.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import Foundation

enum UserDefaultKeys: String {
    case isLoggedIn = "isLoggedIn"
    case verificationId = "verificationId"
}

class GlobalVar: ObservableObject {
    @Published var isPlaying = false
    @Published var currentSongName = ""
    @Published var currentImage = ""
    @Published var isMiniPlay = false
    @Published var currentSongDuration = 0.0
    @Published var currentSongTime = 0.0
}

struct Bhajan: Identifiable, Hashable {
    var id: String
    var image: String
    var url: String
    var lrc: String
    var name: String
    var time: String
    var file: String
    var duration: Int
    var year: String
}

struct Album : Hashable{
    var id = UUID()
    var name : String
    var image : String
    var songs : [Song]
    var year : String
    var imageURl: URL {
        return URL(string: self.image)!
    }
}

struct Song : Hashable{
    var id = UUID()
    var name : String
    var time : String
    var file : String
    var duration : Int
}
