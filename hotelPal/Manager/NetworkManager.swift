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

enum urlAddress{
    static let nearByHotel = "https://hotels-com-provider.p.rapidapi.com/v1/hotels/nearby"
    static let hotelImage = "https://hotels-com-provider.p.rapidapi.com/v1/hotels/photos"
    static let hotelReview = "https://hotels-com-provider.p.rapidapi.com/v1/hotels/reviews"
}

class NetworkManager: ObservableObject{
    
    @Published var hotels = [Hotel]()
    @Published var hotelImages = [HotelImage]()
    @Published var hotelReview : OverView?
    
    private var locationManager: LocationManager?
    private let key = ProcessInfo.processInfo.environment["RapidAPI_KEY"]
    private let server = ProcessInfo.processInfo.environment["RapidAPI_HOST"]
    
    init(locationManager: LocationManager?){
        self.locationManager = locationManager
    }
    
    // MARK: fetch near by hotels
    func fetchNearByHotels(locationManager: LocationManager) {
        if let location = locationManager.location {
            let lat: String = String(format: "%f", location.coordinate.latitude)
            let long: String = String(format: "%f", location.coordinate.longitude)
            let date = Date()
            let modifiedDate = Calendar.current.date(byAdding: .day, value: 3, to: date)!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let checkinDate = formatter.string(from: date)
            let checkoutDate = formatter.string(from: modifiedDate)
            
            let baseURL = urlAddress.nearByHotel
            let queryItems = [URLQueryItem(name: "locale", value: "en_US"),
                              URLQueryItem(name: "adults_number", value: "1"),
                              URLQueryItem(name: "checkin_date", value: checkinDate),
                              URLQueryItem(name: "sort_order", value: "STAR_RATING_HIGHEST_FIRST"),
                              URLQueryItem(name: "checkout_date", value: checkoutDate),
                              URLQueryItem(name: "longitude", value: long),
                              URLQueryItem(name: "currency", value: "USD"),
                              URLQueryItem(name: "latitude", value: lat),
            ]
            var urlComponent = URLComponents(string: baseURL)!
            urlComponent.queryItems = queryItems
            
            var request = URLRequest(url: urlComponent.url!)
            
            request.setValue(key, forHTTPHeaderField: "X-RapidAPI-Key")
            request.setValue(server, forHTTPHeaderField: "X-RapidAPI-Host")
            
            
            let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
                if error != nil{
                    print(error!.localizedDescription)
                }
                else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let result = try decoder.decode(Response.self, from: safeData)
                            var hotelItems : [Hotel] = [Hotel]()
                            
                            #warning("Assigning hotel result from API in the background")
                            DispatchQueue.main.async {
                                if let searchResults = result.searchResults{
                                    for res in searchResults.results{
                                        let beforeCharacter = res.optimizedThumbUrls.srpDesktop.firstIndex(of: "?")!
                                        let imageURL = String(res.optimizedThumbUrls.srpDesktop[...beforeCharacter])
                                        let coordinate = CLLocationCoordinate2D(latitude: res.coordinate.lat, longitude: res.coordinate.lon)
                                        let address = "\(res.address.streetAddress), \(res.address.locality), \(res.address.region), \(res.address.countryName)"
                                        let hotelItem = Hotel(id: res.id, name: res.name, coordinate: coordinate, image: imageURL, starRating: res.starRating, address: address)
                                        hotelItems.append(hotelItem)
                                    }
                                    self.hotels = hotelItems
                                    print(self.hotels.count)
                                }
                            }
                            
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: fetch hotel image by id
    func fetchHotelImageById(id: Int64){
        let baseURL = urlAddress.hotelImage
        let queryItems = [URLQueryItem(name: "hotel_id", value: String(id))]
        var urlComponent = URLComponents(string: baseURL)!
        urlComponent.queryItems = queryItems
        
        var request = URLRequest(url: urlComponent.url!)
        
        request.setValue(key, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue(server, forHTTPHeaderField: "X-RapidAPI-Host")
        let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            else {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do{
                        let result = try decoder.decode([HotelImage].self, from: safeData)
                        DispatchQueue.main.async {
                            self.hotelImages = Array(result[0..<5])
                        }
                    } catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
    // MARK: fetch hotel review
    func fetchHotelReview(id: Int64){
        let baseURL = urlAddress.hotelReview
        let queryItems = [URLQueryItem(name: "hotel_id", value: String(id)),
                          URLQueryItem(name: "locale", value: "en_US"),
                          URLQueryItem(name: "page_number", value: "1")]
        var urlComponent = URLComponents(string: baseURL)!
        urlComponent.queryItems = queryItems
        
        var request = URLRequest(url: urlComponent.url!)
        
        request.setValue(key, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue(server, forHTTPHeaderField: "X-RapidAPI-Host")
        let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            else {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do{
                        let result = try decoder.decode(HotelReview.self, from: safeData)
                        DispatchQueue.main.async {
                            self.hotelReview = result.overview
                        }
                    } catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
