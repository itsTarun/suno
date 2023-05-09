//  TimeTrackView.swift

import SwiftUI

struct TimeTrackView: View {
    @State private var sliderValue: CGFloat = 0
    var body: some View {
        VStack {
            HStack {
                Text(Constants.startTime)
                    .font(.caption)
                    .foregroundColor(Color.darkGray)
                Slider(value: $sliderValue)
                Text(Constants.finishTime)
                    .font(.caption)
                    .foregroundColor(Color.darkGray)
            }
        }
        .padding(.horizontal)
    }
}

fileprivate enum Constants {
    static let startTime = "0:00"
    static let finishTime = "-4:52"
}

struct TimeTrackView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTrackView()
    }
}
