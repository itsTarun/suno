//
//  ListView.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import AVFoundation
import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedSongItem: Bhajan?
    @StateObject var global = GlobalVar()
    @State private var showMiniPlayer = false
    
    @AppStorage(UserDefaultKeys.isLoggedIn.rawValue) var isLogin: Bool = false
    
    var body: some View {
        NavigationView {
            List(dataManager.bhajans, id: \.id) { song in
                
                NavigationLink {
                    
                    PlayerView(album: Album(name: song.name, image: song.image, songs: [Song(name: song.id, time: song.time, file: song.file, duration: song.duration)], year: ""), song: Song(name: song.id, time: song.time, file: song.file, duration: song.duration), slider: 0, timeLabelLeft: "", timeLabelRight: "", currentIndex: 0, playerActive: true)
                        .environmentObject(global)
                    
                } label: {
                    HStack {
                        Text(song.name)
                    }
                }
                
            }
            if global.isMiniPlay {
                MiniPlayer()
            }
        }
        .navigationTitle("Bhajans")
        .environmentObject(global)
        .toolbar {
            ToolbarItem {
                Button {
                    isLogin = false
                } label: {
                    Image(systemName: "seal.fill")
                }
            }
        }
    }
}

struct MiniPlayer : View {
    @EnvironmentObject var global : GlobalVar
    var body : some View {
        ZStack{
            Color.black.opacity(0.2).cornerRadius(20).shadow(radius: 10)
            Image(global.currentImage).resizable().edgesIgnoringSafeArea(.all)
            BlurView(style: .dark).edgesIgnoringSafeArea(.all)
            ProgressView(value: global.currentSongTime, total: global.currentSongDuration)
                .progressViewStyle(.linear)
                .frame(maxHeight: .infinity, alignment: .top)
                .tint(Color(UIColor(hexString: "#1DB954")))
            HStack{
                Image(global.currentImage).resizable().frame(width: 30, height: 30, alignment: .center).clipped()
                VStack(alignment: .leading){
                    Text("\(global.currentSongName) currentSongName")
                        .font(.custom("CircularStd-Bold", size: 15))
                        .foregroundColor(Color.white)
                        .hoverEffect(.lift)
                    Text("Ngọt")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color.white.opacity(0.5))
                        .hoverEffect(.lift)
                }
                
                Spacer()
                Button(action: self.playPause ,label: {
                    Image(systemName: global.isPlaying ? "play.fill" : "pause.fill").resizable()
                }).frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
                
            }.padding(.horizontal, 35)
        }
        .edgesIgnoringSafeArea(.bottom).frame(height: 35, alignment: .bottom)
        .onAppear{
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                global.currentSongTime = CMTimeGetSeconds(player.currentTime())
            }
        }
        
    }
    
    func playPause(){
        global.isPlaying.toggle()
        if global.isPlaying{
            player.pause()
        }else{
            player.play()
        }
    }
}



extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
                .environmentObject(DataManager())
        }
    }
}
