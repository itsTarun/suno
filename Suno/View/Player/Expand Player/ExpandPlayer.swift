//  ExpandPlayer.swift

import SwiftUI

struct ExpandPlayer: View {
    @State private var volume: CGFloat = 0
    @State private var showLyrics = false
    
    @Binding var expand: Bool
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    Spacer(minLength: 48)
                    ExpandPlayerHeaderView(goBack: $expand)
                    ExpandPlayerImageView()
                    ExpandPlayerSongInfoView()
                    
                }
                
                Group {
                    TimeTrackView()
                    PlaybackTrackView()
                    
                    BottomPanel(showLyrcisButtonClicked: {
                        showLyrics.toggle()
                    })
                    
                    if showLyrics {
                        Spacer(minLength: 20)
                        ExpandPlayerLyricsView()
                    }
                    Spacer(minLength: 20)
                }
            }
            .ignoresSafeArea()
        }
    }
}

fileprivate enum Images {
    static let iconMusic = "imagePlayer"
    static let iconSpeaker = "speaker.fill"
    static let iconSpeakerWave = "speaker.wave.2.fill"
}

struct ExpandPlayer_Previews: PreviewProvider {
    static var previews: some View {
        @State var isExpand = true
        ExpandPlayer(expand: $isExpand)
            .ignoresSafeArea()
    }
}
