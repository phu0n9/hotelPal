//
//  HotelImageItemView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 25/07/2022.
//

import SwiftUI

struct HotelImageItemView: View {
    
    var hotelImage: HotelImage
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: self.hotelImage.mainUrl)) { image in
                image
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 100, height: 400)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct HotelImageItemView_Previews: PreviewProvider {
    static var previews: some View {
        HotelImageItemView(hotelImage: HotelImage(mainUrl: "https://exp.cdn-hotels.com/hotels/4000000/3860000/3851700/3851675/66f33f75_z.jpg", imageId: 9729206))
            .previewLayout(.sizeThatFits)
    }
}
