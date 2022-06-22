//
//  MapView.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 22/06/2022.
//

import GoogleMaps
import SwiftUI

struct MapViewBridge: UIViewRepresentable {

    var mapViewDidLongPressAt: (() -> Void)? = nil
    var mapViewIdleAt: (() -> Void)? = nil

    private let gmsMapView = GMSMapView(frame: .zero)

    func makeUIView(context: Context) -> GMSMapView {
        gmsMapView.delegate = context.coordinator
        return gmsMapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Create a GMSMapView centered around the Ho Chi Minh City, Vietnam
        gmsMapView.camera = GMSCameraPosition.camera(
            withTarget: Constants.Location.hoChiMinh,
            zoom: Constants.LocationSettings.defaultZoomLevel
        )
    }

    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }


    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {

        var mapView: MapViewBridge

        init(_ mapView: MapViewBridge) {
            self.mapView = mapView
        }

        func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
            self.mapView.mapViewDidLongPressAt?()
        }

        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            self.mapView.mapViewIdleAt?()
        }
    }
}
