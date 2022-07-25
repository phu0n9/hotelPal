//
//  ReviewView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 26/07/2022.
//

import SwiftUI

enum RatingRange{
    static let veryGood = 9.0...10
    static let good = 7.0..<9.0
    static let medium = 6.0..<8.0
    static let bad = 5.0..<7.0
    static let veryBad = ..<5.0
    case outOfRange
}

struct ReviewView: View {
    
    var hotelReview: OverView
    
    private func displayEmoji(for value: Double) -> Text {
        switch value {
        case RatingRange.veryGood:
            return Text( "\(String(format: "%.1f", value)) 👏")
        case RatingRange.good:
            return Text("\(String(format: "%.1f", value)) 👍")
            case RatingRange.medium:
                return Text("\(String(format: "%.1f", value)) 😐")
            case RatingRange.bad:
                return Text( "\(String(format: "%.1f", value)) 👎")
        case RatingRange.veryBad:
            return Text( "\(String(format: "%.1f", value)) 😵")
            default:
                fatalError("Invalid double value")
        }
    }
    
    private func reviewTitle(title: String,number: Double,offSet: CGFloat) -> AnyView{
        return AnyView(HStack(alignment: .firstTextBaseline){
            Text(title)
                .font(.custom("constan", fixedSize: 15))
                .padding(.horizontal, 5)
            Spacer()
            displayEmoji(for: number)
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
