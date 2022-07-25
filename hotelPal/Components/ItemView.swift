//
//  ItemView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 25/07/2022.
//

import SwiftUI
import MapKit

struct ItemView: View {
    var hotel: Hotel

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: self.hotel.image)) { image in
                image
                    .resizable()
                    .frame(width: 200, height: 250)
            } placeholder: {
                ProgressView()
            }
            
            VStack{
                Text(self.hotel.name)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                HStack(alignment: .firstTextBaseline){
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", self.hotel.starRating))
                }
                .padding(.bottom, 10)
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 200, height: 330)
        .foregroundColor(.black)
        .shadow(radius: 3)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(hotel: Hotel(id: 327238, name: "Romana Resort & Spa", coordinate: CLLocationCoordinate2D(latitude: 10.932796, longitude: 108.162685), image: "https://exp.cdn-hotels.com/hotels/4000000/3860000/3851700/3851675/66f33f75_z.jpg", starRating: 4.0, address: "123 street"))
            .previewLayout(.sizeThatFits)
    }
}
