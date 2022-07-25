//
//  DetailView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 17/07/2022.
//

import SwiftUI
import MapKit

struct BottomView: View {
    
    let hotels: [Hotel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Top hotels near you")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Changa", size: 30))
                
            }.frame(width: UIScreen.main.bounds.size.width, height: 40)
                .background(Color.white)
                .offset(y: 10)
            
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

