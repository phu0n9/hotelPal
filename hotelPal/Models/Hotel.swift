//
//  Hotel.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 22/07/2022.
//
import MapKit

struct Hotel: Identifiable{
    
    var id: Int64
    
    var name: String
    
    var coordinate: CLLocationCoordinate2D
    
    var image: String
    
    var starRating: Double
    
    var address: String
    
}
