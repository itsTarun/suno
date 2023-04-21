//
//  PlayerView.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI
import Firebase
import AVFoundation

var player = AVPlayer()

var timer = Timer()

struct PlayerView : View{
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var global : GlobalVar
    
    var album : Album
    @State var song : Song
    @State var slider: Float
    @State var timeLabelLeft: String
    @State var timeLabelRight: String
    @State var currentIndex: Int
    @State var playerActive : Bool
    
    @State var isAnimating = true
    @State var isShuffle : Bool = false
    @State var isRepeat : Bool = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
            .speed(0.3)
    }
    
    var body: some View {
        ZStack {
            AsyncImage(
                url: album.imageURl,
                placeholder: { Text("Loading ...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .edgesIgnoringSafeArea(.all)
            BlurView(style: .dark).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .font(.headline, weight: Font.Weight.bold)
                        Spacer(minLength: 20)
                    }.onTapGesture(perform: {
                        global.isMiniPlay = true
                        global.currentSongName = self.album.songs[currentIndex].name
                        global.currentImage = self.album.image
                        global.currentSongDuration = Double(self.song.duration)
                        global.currentSongTime = CMTimeGetSeconds(player.currentTime())
                        presentation.wrappedValue.dismiss()
                    })
                    Spacer()
                    Text(album.name).font(.body).foregroundColor(.white).multilineTextAlignment(.center)
                    Spacer()
                    //                    FontIcon.text(.materialIcon(code: .more_horiz), fontsize: 25, color: .white)
                    Image(systemName: "ellipsis.curlybraces")
                        .font(.body, weight: Font.Weight.bold)
                }.padding(.top, 20).padding(.horizontal, 20).frame(maxWidth: .infinity)
                
                Spacer()
                AsyncImage(
                    url: album.imageURl,
                    placeholder: { Text("Loading ...") },
                    image: { Image(uiImage: $0).resizable() }
                )
                .frame(width: 180, height: 180, alignment: .center)
                .clipped()
                .clipShape(Circle())
                .shadow(color: .white, radius: 10)
                .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                .animation(self.isAnimating ? foreverAnimation : .default)
                .onAppear{self.isAnimating = true}
                Text(song.name).font(.headline).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal, 10).padding(.top, 15)
                Spacer()
                
                VStack {
                    Slider(value: $slider){editing in
                        //                        player.currentItem?.seek(to: CMTimeMake(value: Int64(slider * Float(song.duration)), timescale: 1))
                        
                    }
                    
                    HStack{
                        Text(self.timeLabelLeft).font(.custom("CircularStd-Medium", size: 12)).foregroundColor(.white)
                        Spacer()
                        Text(self.timeLabelRight).font(.custom("CircularStd-Medium", size: 12)).foregroundColor(.white)
                    }
                    
                }.frame(maxWidth: .infinity).padding(.horizontal, 15)
                
                
                ZStack {
                    Color.black.opacity(0.2).cornerRadius(20).shadow(radius: 10)
                    HStack{
                        //                        Button(action: self.shuffle, label: {
                        //                            Image(systemName: "shuffle.circle.fill").resizable()
                        //                        }).frame(width: 40, height: 40, alignment: .center).padding(.trailing, 15).foregroundColor(isShuffle ? .blue : .white)
                        //                        Button(action: self.previous, label: {
                        //                            Image(systemName: "backward.end.circle.fill").resizable()
                        //                        }).frame(width: 40, height: 40, alignment: .center).foregroundColor(.white).padding(.trailing, 15)
                        Button(action: self.playPause, label: {
                            Image(systemName: global.isPlaying ? "play.circle.fill" : "pause.circle.fill").resizable()
                        }).frame(width: 60, height: 60, alignment: .center).foregroundColor(.white)
                        //                        Button(action: self.next, label: {
                        //                            Image(systemName: "forward.end.circle.fill").resizable()
                        //                        }).frame(width: 40, height: 40, alignment: .center).foregroundColor(.white).padding(.leading, 15)
                        //                        Button(action: self.replay, label: {
                        //                            Image(systemName: "repeat.circle.fill").resizable()
                        //                        }).frame(width: 40, height: 40, alignment: .center).padding(.leading, 15).foregroundColor(isRepeat ? .blue : .white)
                    }
                    
                    
                }.edgesIgnoringSafeArea(.bottom).frame(height: 150, alignment: .center)
            }
            
            
        }.navigationBarBackButtonHidden(true)
            .onAppear(){
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    updateSlider()
                }
                if playerActive {
                    global.isPlaying = false
                    let url = URL(string: self.album.songs[currentIndex].file)
                    player = AVPlayer(url: url!)
                    self.playPause()
//                    player.play()
                }
            }
    }
    // MARK: - Play or Pause
    func playPause() {
        self.global.isPlaying.toggle()
        self.isAnimating.toggle()
        if global.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    // MARK: - Next Song
    func next() {
        //        if self.isShuffle{
        //            var randomInt = Int.random(in: 0..<self.album.songs.count)
        //            while currentIndex == randomInt{
        //                randomInt = Int.random(in: 0..<self.album.songs.count)
        //            }
        //            currentIndex = randomInt
        //            self.song = self.album.songs[currentIndex]
        //            global.currentSongName = self.album.songs[currentIndex].name
        //            let url = URL(string: self.album.songs[currentIndex].file)
        //            player = AVPlayer(url: url!)
        //            player.play()
        //            updateSlider()
        //        }
        //        else{
        //            self.song = self.album.songs[(currentIndex+1) % self.album.songs.count]
        //            global.currentSongName = self.album.songs[currentIndex].name
        //            let url = URL(string: self.album.songs[(currentIndex+1) % self.album.songs.count].file)
        //            self.currentIndex += 1
        //            player = AVPlayer(url: url!)
        //            player.play()
        //            updateSlider()
        //        }
    }
    // MARK: - Previous Song
    func previous() {
        //        self.song = self.album.songs[(currentIndex-1) % self.album.songs.count]
        //        global.currentSongName = self.album.songs[currentIndex].name
        //        let url = URL(string: self.album.songs[(currentIndex-1) % self.album.songs.count].file)
        //        self.currentIndex -= 1
        //        player = AVPlayer(url: url!)
        //        player.play()
        //        updateSlider()
    }
    // MARK: - Shuffle playlist
    func shuffle() {
        self.isShuffle.toggle()
    }
    // MARK: - Replay song or loop songs
    func replay() {
        self.isRepeat.toggle()
    }
    // MARK: - Update slider
    func updateSlider() {
        let currentSongDuration = Double(self.song.duration)
        let currentTimeInSeconds = CMTimeGetSeconds(player.currentTime())
        let currentTimeLeft = currentSongDuration - currentTimeInSeconds
        if currentTimeInSeconds == currentSongDuration {
            self.song = self.album.songs[(currentIndex+1) % self.album.songs.count]
            let url = URL(string: self.album.songs[(currentIndex+1) % self.album.songs.count].file)
            self.currentIndex += 1
            player = AVPlayer(url: url!)
            player.play()
            updateSlider()
        }
        
        let mins = currentTimeInSeconds / 60
        let secs = currentTimeInSeconds.truncatingRemainder(dividingBy: 60)
        let minsLeft = currentTimeLeft / 60
        let secsLeft = currentTimeLeft.truncatingRemainder(dividingBy: 60)
        
        let timeformatter = NumberFormatter()
        timeformatter.minimumIntegerDigits = 2
        timeformatter.minimumFractionDigits = 0
        timeformatter.roundingMode = .down
        guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
            return
        }
        guard let minsStrLeft = timeformatter.string(from: NSNumber(value: minsLeft)), let secsStrLeft = timeformatter.string(from: NSNumber(value: secsLeft)) else {
            return
        }
        self.timeLabelLeft = "\(minsStr):\(secsStr)"
        self.timeLabelRight = "\(minsStrLeft):\(secsStrLeft)"
        self.slider = Float(currentTimeInSeconds)
        
        
        if let currentItem = player.currentItem {
            let duration = currentItem.duration
            if (CMTIME_IS_INVALID(duration)) {
                print(self.slider)
                return;
            }
            let currentTime = currentItem.currentTime()
            self.slider = Float(CMTimeGetSeconds(currentTime) / CMTimeGetSeconds(duration))
        }
        
    }
}
