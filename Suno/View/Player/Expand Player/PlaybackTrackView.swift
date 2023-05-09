//  PlaybackTrackView.swift

import SwiftUI

struct PlaybackTrackView: View {
    var body: some View {
        HStack {
            Button {} label: {
                Image(systemName: Images.iconBackward)
                    .foregroundColor(.primary)
                    .font(.largeTitle)
            }
            Spacer()
            Button {} label: {
                Image(systemName: Images.iconPlay)
                    .foregroundColor(.primary)
                    .font(.largeTitle)
            }
            Spacer()
            Button {} label: {
                Image(systemName: Images.iconForward)
                    .foregroundColor(.primary)
                    .font(.largeTitle)
            }
        }
        .padding(.horizontal, 60)
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
}

fileprivate enum Images {
    static let iconPlay = "play.fill"
    static let iconForward = "forward.fill"
    static let iconBackward = "backward.fill"
}

struct PlaybackTrackView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackTrackView()
    }
}
