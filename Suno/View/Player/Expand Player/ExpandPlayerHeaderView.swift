//
//  ExpandPlayerHeaderView.swift
//  Suno
//
//  Created by Tarun on 09/05/23.
//

import SwiftUI

struct ExpandPlayerHeaderView: View {
    @Binding var goBack: Bool
    var body: some View {
        HStack {
            Button {
                self.goBack.toggle()
            } label: {
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 50, height: 50)
            }
            .tint(.primary)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "square.and.arrow.up")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 50, height: 50)
            }
            .tint(.primary)
        }
        .padding(.trailing, 8)
        .padding(.top, -20)
    }
}

struct ExpandPlayerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        @State var goBack = false
        ExpandPlayerHeaderView(goBack: $goBack)
    }
}
