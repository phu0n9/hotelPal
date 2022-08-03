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

struct WelcomeView: View {
    @State private var isActive = false
    @State private var y :CGFloat = 0
    @State private var addThis: CGFloat = 50
    
    var body: some View {
        if isActive{
            MainView()
        } else {
            ZStack{
                // MARK: ICON
                Image("splash-screen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 0,y: y)
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                            withAnimation(.easeInOut(duration: 2.0)) {
                                self.addThis = -self.addThis
                                self.y = self.y + self.addThis
                            }
                        }
                    }
                // MARK: TEXT
                BlurView(text: "Hotel Pal", textSize: 50, startTime: 3.0, fontFamily: "Changa", offSetValue: 70)
                
                
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now()+5.0){
                    withAnimation(){
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeView()
        }
    }
}
