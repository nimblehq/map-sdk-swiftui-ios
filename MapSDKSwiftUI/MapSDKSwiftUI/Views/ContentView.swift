//
//  ContentView.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 21/06/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack(alignment: .top) {
            MapView()
            // Uncomment this for using the MapView that conforms the UIViewControllerRepresentable
            // MapViewControllerBridge()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
