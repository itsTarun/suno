//
//  CustomNavLink.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 26/04/23.
//

import SwiftUI

struct CustomNavLink<Label, Destination>: View where Label: View, Destination: View  {
    let label: Label
    let destination: Destination
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.label = label()
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination
            }
            .toolbar(.hidden)
        } label: {
            label
        }
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink(
                destination: Text("Destination")) {
                    Text("Click ME")
                }
        }
    }
}
