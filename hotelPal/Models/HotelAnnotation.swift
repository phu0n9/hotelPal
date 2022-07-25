//
//  HotelAnnotation.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 22/07/2022.
//

import MapKit
import UIKit

final class HotelAnnotation: NSObject, MKAnnotation{
    let title: String?
    
    let coordinate: CLLocationCoordinate2D
    
    init(hotel: Hotel) {
        self.title = hotel.name
        self.coordinate = hotel.coordinate
    }
}
