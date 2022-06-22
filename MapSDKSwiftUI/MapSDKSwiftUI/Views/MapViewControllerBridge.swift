//
//  MapViewControllerBridge.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 22/06/2022.
//

import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {

    var mapViewDidLongPressAt: (() -> Void)? = nil
    var mapViewIdleAt: (() -> Void)? = nil

    func makeUIViewController(context: Context) -> MapViewController {
        let uiViewController = MapViewController()
        uiViewController.gmsMapView.delegate = context.coordinator
        return uiViewController
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        // Create a GMSMapView centered around the Ho Chi Minh City, Vietnam
        uiViewController.gmsMapView.camera = GMSCameraPosition.camera(
            withTarget: Constants.Location.hoChiMinh,
            zoom: Constants.LocationSettings.defaultZoomLevel
        )
    }

    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }

    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var mapViewControllerBridge: MapViewControllerBridge

        init(_ mapViewControllerBridge: MapViewControllerBridge) {
            self.mapViewControllerBridge = mapViewControllerBridge
        }

        func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
            self.mapViewControllerBridge.mapViewDidLongPressAt?()
        }

        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            self.mapViewControllerBridge.mapViewIdleAt?()
        }
    }
}
