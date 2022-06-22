//
//  MapViewController.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 22/06/2022.
//

import GoogleMaps
import UIKit

class MapViewController: UIViewController {

    let gmsMapView = GMSMapView(frame: .zero)

    override func loadView() {
        super.loadView()
        self.view = gmsMapView
    }
}
