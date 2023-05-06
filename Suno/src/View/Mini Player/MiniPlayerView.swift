//
//  MiniPlayerView.swift
//  Suno
//
//  Created by Tarun on 06/05/23.
//

import SwiftUI

struct MiniPlayerView: View {
    var animation: Namespace.ID
    @Binding var expand: Bool
    
    let height = UIScreen.main.bounds.height / 3
    let safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var offset: CGFloat = 0
    
    @State private var volume: CGFloat = 0
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? safeArea?.top :  0)
                .padding(.vertical, expand ? 30 : 0)
            
            HStack(spacing: 15) {
                if expand { Spacer(minLength: 0) }
                
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 60, height: expand ? height : 60)
                    .background(.label)
                    .cornerRadius(14)
                
                if !expand {
                    Text("Ganesh JI ki Aarti")
                        .font(.body)
                        .fontWeight(.bold)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
                Spacer(minLength: 0)
                
                if !expand {
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .font(.title2)
                            .foregroundColor(.label)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .font(.title2)
                            .foregroundColor(.label)
                    }
                }
            } .padding(.horizontal)
            
            VStack(spacing: 15) {
                Spacer(minLength: 0)
                
                HStack {
                    if expand {
                        Text("Ganesh Ji ki aarti")
                            .font(.body)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    Spacer(minLength: 0)
                    Button(action: {} ) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                    .padding()
                    .padding(.top, 20)
                
                Spacer(minLength: 0)
                
                // stop button
                Button(action: {}) {
                    Image(systemName: "stop.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
                .padding()
                
                // volume control
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    Slider(value: $volume).tint(.primary)
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                // bottom actions
                HStack(spacing: 22) {
                    Button(action: {}) {
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Button(action: {}) {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
                
                Spacer(minLength: 0)
            }
            // this will give strech effect..
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
            
        }
        // expanding to full screen when clicked
        .frame(maxHeight: expand ? .infinity : 80)
        .background(BlurView().ignoresSafeArea(edges: .bottom).onTapGesture {
            withAnimation(.spring()) { expand.toggle() }
        })
        .cornerRadius(expand ? 20 : 0)
        .shadow(color: .black.opacity(0.3).opacity(0.8), radius: 6, x: 1, y: 1)
        .padding(expand ? 0 : 16)
        // moving the miniPlayer above the tabBar
        // approx tab bar height 59
        .offset(y: expand ? 0 : -60)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }
    
    private func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    private func onEnded(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            // if view is > than height / 3 then closing view
            if value.translation.height > height {
                expand = false
            }
            offset = 0
        }
    }
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        @State var miniPlayerExpand = false
        @Namespace var animation
        MiniPlayerView(animation: animation, expand: $miniPlayerExpand)
    }
}
