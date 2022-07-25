//
//  DetailView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 25/07/2022.
//

import SwiftUI
import MapKit

struct DetailView: View {
    var hotel: Hotel
    
    @ObservedObject private var networkManager: NetworkManager = NetworkManager(locationManager: nil)
    
    @State private var hotelImages: [HotelImage] = [HotelImage]()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top,spacing: 10) {
                            ForEach(self.networkManager.hotelImages, id: \.imageId) { hotelImage in
                                HotelImageItemView(hotelImage: hotelImage)
                            }
                        }
                    }
                        
                    Text(hotel.name)
                        .fontWeight(.bold)
                        .font(.custom("Changa", fixedSize: 30))
                        .padding(.horizontal, 20)
                    
                    HStack{
                        HStack(alignment: .firstTextBaseline){
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", hotel.starRating))
                                .font(.custom("constan", fixedSize: 20))
                        }
                        .padding(.horizontal, 20)
                    }.padding(.bottom, 5)
                    
                    Text(hotel.address)
                        .font(.custom("constand", fixedSize: 25))
                        .padding(.horizontal, 20)
                    
                    if let hotelReview = self.networkManager.hotelReview{
                        ReviewView(hotelReview: hotelReview)
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onAppear(){
            networkManager.fetchHotelImageById(id: hotel.id)
            networkManager.fetchHotelReview(id: hotel.id)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(hotel: Hotel(id: 363464, name: "Hello", coordinate: CLLocationCoordinate2D(latitude: 123.4, longitude: 122.5), image: "sss", starRating: 4.5,address: "123 street"))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
