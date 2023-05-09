//  BottomPanel.swift

import SwiftUI

struct BottomPanel: View {
    var showLyrcisButtonClicked: () -> Void
    var body: some View {
        HStack {
            Button {
                showLyrcisButtonClicked()
            } label: {
                Image(systemName: Images.iconQuoteBubble)
                    .foregroundColor(.primary)
                    .font(.title2)
            }

            Spacer()

            Button {} label: {
                Image(systemName: Images.iconAirpods)
                    .foregroundColor(.primary)
                    .font(.title2)
            }

            Spacer()

            Button {} label: {
                Image(systemName: Images.iconShuffle)
                    .foregroundColor(.primary)
                    .font(.title2)
            }
        }
        .padding(.horizontal, 80)
        .padding(.top, 20)
    }
}

fileprivate enum Images {
    static let iconQuoteBubble = "quote.bubble"
    static let iconAirpods = "shuffle"
    static let iconShuffle = "list.bullet"
}


struct BottomPanel_Previews: PreviewProvider {
    static var previews: some View {
        BottomPanel(showLyrcisButtonClicked: {})
    }
}
