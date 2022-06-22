//
//  ContentView.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 21/06/2022.
//

import ToastUI
import SwiftUI

struct ContentView: View {

    @State private var presentingToast: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            MapView {
                presentingToast = true
            } mapViewIdleAt: {
                print("MapView is idling")
            }

            // Uncomment this for using the MapViewControllerBridge that conforms the UIViewControllerRepresentable
//            MapViewControllerBridge {
//                presentingToast = true
//            } mapViewIdleAt: {
//                print("MapView is idling")
//            }
        }
        .ignoresSafeArea()
        .toast(isPresented: $presentingToast) {
            ToastView {
                VStack {
                    Text("MapView did long pressed")
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                    Button {
                        presentingToast = false
                    } label: {
                        Text("OK")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
