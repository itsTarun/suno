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
                url: bhajan.image,
                placeholder: { BlurView() },
                image: { Image(uiImage: $0).resizable() }
            )
            .scaledToFill()
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(bhajan: Bhajan())
    }
}
