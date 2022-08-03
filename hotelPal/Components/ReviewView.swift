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

struct ReviewView: View {
    
    var hotelReview: OverView
    
    private func reviewTitle(title: String,number: Double,offSet: CGFloat) -> AnyView{
        return AnyView(HStack(alignment: .firstTextBaseline){
            Text(title)
                .font(.custom("constan", fixedSize: 15))
                .padding(.horizontal, 5)
            Spacer()
            StarsView(rating: number / 2.0)
            Text("\(String(format: "%.1f", number / 2.0))")
        }
        .offset(y: offSet))
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .firstTextBaseline){
                Text("Overall \(String(format: "%.1f", hotelReview.overall))")
                    .font(.custom("Changa", fixedSize: 20))
                    .fontWeight(.bold)
                Spacer()
                Text("\(String(format: "%d", hotelReview.totalCount)) counts")
                    .font(.custom("Changa", fixedSize: 20))
                    .fontWeight(.bold)
            }

            reviewTitle(title: "Hotel Service", number: hotelReview.hotelService, offSet: 5)

            reviewTitle(title: "Room Comfort", number: hotelReview.roomComfort, offSet: 10)
            
            reviewTitle(title: "Hotel Condition", number: hotelReview.hotelCondition, offSet: 15)
            
            reviewTitle(title: "Cleaniness", number: hotelReview.cleanliness, offSet: 20)
            
            reviewTitle(title: "Neighbourhood", number: hotelReview.neighbourhood, offSet: 25)
            
        }.multilineTextAlignment(.leading)
            .padding()
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(hotelReview: OverView(totalCount: 480, overall: 9.0, qualitativeBadgeText: "very good", hotelService: 9.0, roomComfort: 6.5, hotelCondition: 5.6, cleanliness: 7.8, neighbourhood: 4.5))
            .previewLayout(.sizeThatFits)
    }
}
