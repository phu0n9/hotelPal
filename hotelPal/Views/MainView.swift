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

struct MainView: View {
    
    @State var userTrackingMode: MKUserTrackingMode = .follow
    @StateObject private var location: LocationManager = LocationManager()
    
#warning("change stateObject to ObservedObject to see the result")
    @StateObject private var network = NetworkManager(locationManager: LocationManager.init())
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                
                // MARK: map displaying placemarks
                MapView(userTrackingMode: $userTrackingMode,hotels: self.network.hotels)
                
                // MARK: bottom view
                if self.network.hotels.count > 0 {
                    BottomView(hotels: self.network.hotels)
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        .onAppear(){
            #warning("fetching near by hotel API in the background to get current user location first")
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
