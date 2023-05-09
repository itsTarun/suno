//  miniPlayer.swift

import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .background(.label)
                    .cornerRadius(14)

                Text(Constants.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.horizontal, 15)
                Spacer(minLength: 0)
                Button {} label: {
                    Image(systemName: Images.iconPlay)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
//                Button {} label: {
//                    Image(systemName: Images.iconForward)
//                        .font(.title2)
//                        .foregroundColor(Colors.black)
//                }
//                .padding(.leading, 25)
            }
            .padding([.horizontal, .leading], 20.0)
        }
    }
}

fileprivate enum Constants {
    static let title = "Ganesh Ji Ki Aarti"
    static let description = "T-series"
}

fileprivate enum Images {
    static let iconMusic = "imagePlayer"
    static let iconPlay = "play.fill"
    static let iconForward = "forward.fill"
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
    }
}

