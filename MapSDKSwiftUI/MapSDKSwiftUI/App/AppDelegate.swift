//
//  AppDelegate.swift
//  MapSDKSwiftUI
//
//  Created by Minh Pham on 21/06/2022.
//

import GoogleMaps

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // Put the Google Maps setup code here
        GMSServices.provideAPIKey(googleMapApiKey)

        return true
    }
}
