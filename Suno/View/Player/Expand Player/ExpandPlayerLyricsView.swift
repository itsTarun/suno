//
//  ExpandPlayerLyricsView.swift
//  Suno
//
//  Created by Tarun on 09/05/23.
//

import SwiftUI

struct ExpandPlayerLyricsView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.yellow]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .padding()
            
            VStack {
                HStack {
                    Text("Lyrics")
                        .padding(.leading, 8)
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: 50, height: 50)
                    }
                    .tint(.primary)
                }
                
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: [GridItem(.flexible())]) {
                        ForEach(0...10, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 8)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        .padding(.top, -40)
        .shadow(color: .black.opacity(0.3).opacity(0.8), radius: 6, x: 1, y: 1)
        .frame(height: 200)
    }
}

struct ExpandPlayerLyricsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandPlayerLyricsView()
    }
}
