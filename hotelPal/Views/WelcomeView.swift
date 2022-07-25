//
//  WelcomeView.swift
//
//  Created by Nguyen Huynh Phuong Anh on 16/07/2022.
//

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
        WelcomeView()
    }
}
