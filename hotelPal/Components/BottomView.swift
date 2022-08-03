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
import MapKit

struct BottomView: View {
    
    let hotels: [Hotel]
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: TITLE
            HStack {
                Text("Top hotels near you")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Changa", size: 30))
                
            }.frame(width: UIScreen.main.bounds.size.width, height: 40)
                .background(Color.white)
                .offset(y: 10)
            
            // MARK: LIST OF HOTELS
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top,spacing: 10) {
                    ForEach(self.hotels, id: \.id) { hotel in
                        NavigationLink(destination: DetailView(hotel: hotel)){
                            ItemView(hotel: hotel)
                        }
                    }
                }
            }.padding()
            Spacer()
                .frame(width: UIScreen.main.bounds.size.width, height: 10)
        }.cornerRadius(10)
            .background(Color.white)
            .offset(y: UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 2)
    }
}

