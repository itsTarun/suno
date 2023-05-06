//
//  ListCell.swift
//  Suno
//
//  Created by Tarun on 06/05/23.
//

import SwiftUI

struct ListCell: View {
    var bhajan: Bhajan
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: bhajan.image)!,
                placeholder: { BlurView() },
                image: { Image(uiImage: $0).resizable() }
            )
            .scaledToFit()
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(bhajan: Bhajan())
    }
}
