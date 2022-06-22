//
//  MapView.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 22/06/2022.
//

import GoogleMaps
import SwiftUI

struct MapView: UIViewRepresentable {

    var mapViewWillMove: (() -> Void)? = nil
    var idleAt: (() -> Void)? = nil

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

        var mapView: MapView

        init(_ mapView: MapView) {
            self.mapView = mapView
        }

        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            self.mapView.mapViewWillMove?()
        }

        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            self.mapView.idleAt?()
        }
    }
}
