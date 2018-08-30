//
//  FirstViewController.swift
//  Tabbed
//
//  Created by Johan Van Der Werff on 2018/08/29.
//  Copyright © 2018 Net1. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
      configureLocation()
    }
 
    private func configureLocation()
    {
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined
        {
            locationManager.requestAlwaysAuthorization()
        }
        else if status == .authorizedAlways || status == .authorizedWhenInUse
        {
            mapView.showsUserLocation = true
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

    private func zoomIntoLocation(with coordinate: CLLocationCoordinate2D)
    {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 5000, 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //print("Get latest location")
        guard let latestLocation = locations.first
        else
        {
            return
        }
        
        if currentLocation == nil
        {
            zoomIntoLocation(with: latestLocation.coordinate)
        }
        currentLocation = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            configureLocation()
        }
    }
}
