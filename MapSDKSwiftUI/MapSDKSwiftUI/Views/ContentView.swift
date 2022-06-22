//
//  ContentView.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 21/06/2022.
//

import SwiftUI

struct ContentView: View {

    @State var zoomInCenter: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Map
                let diameter = zoomInCenter ? geometry.size.width : (geometry.size.height * 2.0)
                MapViewControllerBridge(mapViewWillMove: { (isGesture) in
                    guard isGesture else { return }
                    self.zoomInCenter = false
                })
                .clipShape(
                    Circle()
                        .size(
                            width: diameter,
                            height: diameter
                        )
                        .offset(
                            CGPoint(
                                x: (geometry.size.width - diameter) / 2.0,
                                y: (geometry.size.height - diameter) / 2.0
                            )
                        )
                )
                .animation(.easeIn, value: 0)
                .background(Color(red: 254.0/255.0, green: 1, blue: 220.0/255.0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
