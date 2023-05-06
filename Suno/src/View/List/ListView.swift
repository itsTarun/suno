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
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    @AppStorage(UserDefaultKeys.isLoggedIn.rawValue) var isLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(1...10, id: \.self) {_ in
                        CustomNavLink(
                            destination: Text("Ganesh JI")
                        ) {
                            ListCell(bhajan: Bhajan())
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 180)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding()
                .padding(.bottom, 160)
                
                .navigationDestination(for: Bhajan.self, destination: { song in
                    //                play(song)
                })
                .navigationTitle("All Bhajans")
                //            .listStyle(.grouped)
                .toolbar {
                    ToolbarItem {
                        Button {
                            showLogoutAlert.toggle()
                        } label: {
                            Image(systemName: "gear")
                                .font(.headline)
                        }
                    }
                }
                .alert(isPresented: $showLogoutAlert, content: {
                    
                    Alert(title: Text("Are you sure, you want to logout?"), primaryButton: Alert.Button.cancel(), secondaryButton: Alert.Button.destructive(Text("Yes"), action: {
                        isLogin = false
                    }))
                })
            }
        }
        .environmentObject(global)
    }
    
    //    @ViewBuilder
    //    func play(_ song: Bhajan) -> some View {
    //        PlayerView(
    //            album: Album(
    //                name: song.name,
    //                image: song.image,
    //                songs: [
    //                    Song(
    //                        name: song.id,
    //                        time: song.time,
    //                        file: song.file,
    //                        duration: song.duration
    //                    )
    //                ], year: ""
    //            ),
    //            song: Song(
    //                name: song.id,
    //                time: song.time,
    //                file: song.file,
    //                duration: song.duration
    //            ),
    //            slider: 0,
    //            timeLabelLeft: "",
    //            timeLabelRight: "",
    //            currentIndex: 0,
    //            playerActive: true
    //        )
    //        .navigationBarHidden(true)
    //    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
