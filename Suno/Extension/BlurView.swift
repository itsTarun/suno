//
//  BlurView.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI

struct BlurView: UIViewRepresentable{
    var style : UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView{
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
