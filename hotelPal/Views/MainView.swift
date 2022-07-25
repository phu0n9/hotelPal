//
//  MainView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 17/07/2022.
//

import SwiftUI
import MapKit

struct MainView: View {
    
    @State var userTrackingMode: MKUserTrackingMode = .follow
    @StateObject private var location: LocationManager = LocationManager()
    @StateObject private var network = NetworkManager(locationManager: LocationManager.init())
    @State private var tapped: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                
                MapView(userTrackingMode: $userTrackingMode,hotels: self.network.hotels)
             
                if self.network.hotels.count > 0 {
                    BottomView(hotels: self.network.hotels)
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
            .onAppear(){
                DispatchQueue.main.async {
                    network.fetchNearByHotels(locationManager: location)
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
