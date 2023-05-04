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
    @State private var showLogoutAlert = false
    
    @AppStorage(UserDefaultKeys.isLoggedIn.rawValue) var isLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(dataManager.bhajans, id: \.id) { song in
                    
                    NavigationLink(value: song) {
                        
                        HStack {
                            AsyncImage(
                                url: URL(string: song.image)!,
                                placeholder: { Text("Loading ...") },
                                image: { Image(uiImage: $0).resizable() }
                            )
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .leading)
                            
                            Text(song.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    
                }
                if global.isMiniPlay {
                    MiniPlayer()
                }
            }
            .navigationDestination(for: Bhajan.self, destination: { song in
                play(song)
            })
            .navigationTitle("All Bhajans")
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem {
                    Button {
                        showLogoutAlert.toggle()
                    } label: {
                        Image(systemName: "seal.fill")
                    }
                }
            }
            .alert(isPresented: $showLogoutAlert, content: {
                
                Alert(title: Text("Are you sure, you want to logout?"), primaryButton: Alert.Button.default(Text("Okay")), secondaryButton: Alert.Button.destructive(Text("Yes"), action: {
                    isLogin = false
                }))
            })
        }
        .environmentObject(global)
    }
    
    @ViewBuilder
    func play(_ song: Bhajan) -> some View {
        PlayerView(
            album: Album(
                name: song.name,
                image: song.image,
                songs: [
                    Song(
                        name: song.id,
                        time: song.time,
                        file: song.file,
                        duration: song.duration
                    )
                ], year: ""
            ),
            song: Song(
                name: song.id,
                time: song.time,
                file: song.file,
                duration: song.duration
            ),
            slider: 0,
            timeLabelLeft: "",
            timeLabelRight: "",
            currentIndex: 0,
            playerActive: true
        )
        .navigationBarHidden(true)
    }
}

struct MiniPlayer : View {
    @EnvironmentObject var global : GlobalVar
    var body : some View {
        ZStack {
            Color.black.opacity(0.2).cornerRadius(20).shadow(radius: 10)
            Image(global.currentImage).resizable().edgesIgnoringSafeArea(.all)
            BlurView(style: .dark).edgesIgnoringSafeArea(.all)
            ProgressView(value: global.currentSongTime, total: global.currentSongDuration)
                .progressViewStyle(.linear)
                .frame(maxHeight: .infinity, alignment: .top)
                .tint(Color.systemGreen)
            HStack {
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
    
    func playPause() {
        global.isPlaying.toggle()
        if global.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
