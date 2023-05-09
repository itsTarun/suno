//
//  Bhajan.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import Foundation

let staticImageURL: String = "https://firebasestorage.googleapis.com/v0/b/suno-76c28.appspot.com/o/Hindu%20God%20Images%2FGanesh%2FGanesh.jpeg?alt=media&token=fe97bd72-e919-4cfb-bb62-9cfc362b6785"

enum UserDefaultKeys: String {
    case isLoggedIn = "isLoggedIn"
    case verificationId = "verificationId"
}

//class GlobalVar: ObservableObject {
//    @Published var isPlaying = false
//    @Published var currentSongName = ""
//    @Published var currentImage = ""
//    @Published var isMiniPlay = false
//    @Published var currentSongDuration = 0.0
//    @Published var currentSongTime = 0.0
//}

struct Bhajan: Identifiable, Hashable {
    var id: String
    var image: URL
    var url: String
    var lrc: String
    var name: String
    var time: String
    var file: String
    var duration: Int
    var year: String
}

extension Bhajan {
    init() {
        self.id = ""
        self.image = URL(string: staticImageURL)!
        self.url = ""
        self.lrc = ""
        self.name = "Ganesh Ji"
        self.time = ""
        self.file = ""
        self.duration = 0
        self.year = ""
    }
}
//
//struct Album : Hashable{
//    var id = UUID()
//    var name : String
//    var image : String
//    var songs : [Song]
//    var year : String
//    var imageURl: URL {
//        return URL(string: self.image)!
//    }
//}
//
//struct Song : Hashable{
//    var id = UUID()
//    var name : String
//    var time : String
//    var file : String
//    var duration : Int
//}
