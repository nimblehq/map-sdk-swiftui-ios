//
//  MapViewControllerBridge.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 22/06/2022.
//

import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {

    var mapViewWillMove: (Bool) -> ()

    func makeUIViewController(context: Context) -> MapViewController {
        let uiViewController = MapViewController()
        uiViewController.map.delegate = context.coordinator
        return uiViewController
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        print("update MapViewControllerBridge UI when needed")
    }

    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }

    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var mapViewControllerBridge: MapViewControllerBridge

        init(_ mapViewControllerBridge: MapViewControllerBridge) {
            self.mapViewControllerBridge = mapViewControllerBridge
        }

        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            self.mapViewControllerBridge.mapViewWillMove(gesture)
        }
    }
}
