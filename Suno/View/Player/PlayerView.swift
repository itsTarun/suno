//  PlayerView.swift

import SwiftUI

struct PlayerView: View, KeyboardReadable {
    
    @Binding var expand: Bool
    var animation: Namespace.ID
    
    @State private var isKeyboardVisible = false
    @State private var offset: CGFloat = 0
    
    var body: some View {
        if expand {
            ExpandPlayer(expand: $expand)
                .frame(maxHeight: .infinity)
                .background(
                    BlurView()
                )
                .ignoresSafeArea()
        } else {
            MiniPlayer()
                .frame(maxHeight: 80)
                .background(BlurView().ignoresSafeArea(edges: .bottom).onTapGesture {
                    withAnimation(.spring()) { expand.toggle() }
                })
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3).opacity(0.8), radius: 6, x: 1, y: 1)
                .onReceive(keyboardPublisher) { newIsKeyboardVisible in
                    isKeyboardVisible = newIsKeyboardVisible
                }
                .padding(16)
                .offset(y: isKeyboardVisible ? 0 : -49)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        @State var miniPlayerExpand = true
        @Namespace var animation
        
        PlayerView(expand: $miniPlayerExpand, animation: animation)
    }
}
