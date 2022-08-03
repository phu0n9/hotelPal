/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Huynh Anh Phuong
  ID: s3695662
  Created  date: 22/07/2022
  Last modified: 03/08/2022
  Acknowledgement: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces
*/

import MapKit
import UIKit

final class HotelAnnotation: NSObject, MKAnnotation{
    let id: Int64
    
    let title: String?
    
    let coordinate: CLLocationCoordinate2D
    
    init(hotel: Hotel) {
        self.id = hotel.id
        self.title = hotel.name
        self.coordinate = hotel.coordinate
    }
}
