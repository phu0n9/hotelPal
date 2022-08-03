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

struct Response: Decodable{
    let searchResults: Results?
}

struct Results: Decodable{
    let results: [Items]
}

struct Items: Decodable{
    let id: Int64
    let coordinate : Coordinate
    let name: String
    let starRating: Double
    let address: Address
    let optimizedThumbUrls: ImageURL
}

struct ImageURL: Decodable{
    let srpDesktop: String
}

struct Address: Decodable{
    let streetAddress: String
    let countryName: String
    let locality: String
    let region: String
}

struct Coordinate: Decodable{
    let lat,lon : Double
}

struct HotelImage: Decodable{
    let mainUrl: String
    let imageId: Int64
}

struct HotelReview: Decodable{
    let overview: OverView
}

struct OverView: Decodable{
    let totalCount: Int
    let overall: Double
    let qualitativeBadgeText: String
    let hotelService: Double
    let roomComfort: Double
    let hotelCondition: Double
    let cleanliness: Double
    let neighbourhood: Double
}
