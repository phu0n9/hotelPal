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

struct Hotel: Identifiable{
    
    var id: Int64
    
    var name: String
    
    var coordinate: CLLocationCoordinate2D
    
    var image: String
    
    var starRating: Double
    
    var address: String
    
}
