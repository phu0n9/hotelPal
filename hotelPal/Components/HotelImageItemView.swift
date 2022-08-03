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

import SwiftUI

struct HotelImageItemView: View {
    
    var hotelImage: HotelImage
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: self.hotelImage.mainUrl)) { image in
                image
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 400)
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
