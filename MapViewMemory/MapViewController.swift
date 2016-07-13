//
//  MapViewController.swift
//  MapViewMemmory
//
//  Created by Adrian Tofan on 12/07/2016.
//  Copyright © 2016 Adrian Tofan. All rights reserved.
//

import MapKit

class MapViewController: UIViewController {
  let mapView = MKMapView(frame: UIScreen.mainScreen().bounds)
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.autoresizingMask = [.None]
    view.addSubview(mapView)
    mapView.delegate = self
    mapView.mapType = .Satellite
    showRandomPosition()
  }

  deinit{
    mapView.delegate = nil
  }

  func showRandomPosition(){
    let topLeftLat =  48.298865
    let topLeftLon =  -1.198441
    let dLat =  46.717117 - topLeftLat
    let dLon =   6.116483 - topLeftLon
    let d = drand48()
    let center = CLLocationCoordinate2D(latitude: topLeftLat + d * dLat,
                                        longitude: topLeftLon + d * dLon)
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.00000001, longitudeDelta: 0.00000001))
    mapView.setRegion(region, animated: false)
  }
}

extension MapViewController : MKMapViewDelegate {

}
