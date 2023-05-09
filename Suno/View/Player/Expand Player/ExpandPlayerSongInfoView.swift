//
//  ExpandPlayerSongInfoView.swift
//  Suno
//
//  Created by Tarun on 09/05/23.
//

import SwiftUI

struct ExpandPlayerSongInfoView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constants.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(Constants.description)
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.darkGray)
                    .lineLimit(1)
            }
            Spacer()
            Button {} label: {
                Image(systemName: "ellipsis.circle.fill")
                    .foregroundColor(Color.darkGray)
                    .font(.title)
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
}


fileprivate enum Constants {
    static let title = "Ganesh JI ki aarti"
    static let description = "By: T-series"
}


struct ExpandPlayerSongInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandPlayerSongInfoView()
    }
}
