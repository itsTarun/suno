//
//  ExpandPlayerImageView.swift
//  Suno
//
//  Created by Tarun on 09/05/23.
//

import SwiftUI

struct ExpandPlayerImageView: View {
    var body: some View {
        ZStack {
            AsyncImage(
                url: URL(string: staticImageURL)!,
                placeholder: { BlurView() },
                image: { Image(uiImage: $0).resizable() }
            )
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height / 3)
            .cornerRadius(10)
            .shadow(color: Color.darkGray, radius: 5)
        }
    }
}

struct ExpandPlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandPlayerImageView()
    }
}
