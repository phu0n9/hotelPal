//
//  MapView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 22/07/2022.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject,MKMapViewDelegate{
    var control : MapView
    
    init(_ control: MapView){
        self.control = control
    }
    
    // MARK - Zoom In when starting function
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first{
            if let annotation = annotationView.annotation{
                if annotation is MKUserLocation{
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000,longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
    
    // MARK - Track user location
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        DispatchQueue.main.async {
            self.control.$userTrackingMode.wrappedValue = mode
        }
    }
}

struct MapView: UIViewRepresentable{
    
    @Binding var userTrackingMode: MKUserTrackingMode
    let hotels: [Hotel]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: UIScreen.main.bounds)
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = userTrackingMode
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // something
        uiView.userTrackingMode = userTrackingMode
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.hotels.map(HotelAnnotation.init)
        mapView.addAnnotations(annotations)
        
    }
}
