//  ContentView.swift
//  AsyncImage

import SwiftUI

let posters = [
    "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg",
    "https://image.tmdb.org/t/p/original/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
    "https://image.tmdb.org/t/p/original/6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg",
    "https://image.tmdb.org/t/p/original/7GsM4mtM0worCtIVeiQt28HieeN.jpg"
].map { URL(string: $0)! }

struct AsyncImageContentView: View {
    var body: some View {
         List(posters, id: \.self) { url in
             AsyncImage(
                url: url,
                placeholder: { BlurView() },
                image: { Image(uiImage: $0).resizable() }
             )
            .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
         }
    }
}


struct AsyncImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageContentView()
    }
}
