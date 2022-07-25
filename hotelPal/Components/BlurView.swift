//
//  BlurView.swift
//  hotelPal
//
//  Created by Nguyen Huynh Phuong Anh on 17/07/2022.
//

import SwiftUI

struct BlurView: View {
    let characters: Array<String.Element>
    let startTime: Double
    let textSize: Double
    let fontFamily: String
    let offSetValue: Double
    @State var blurValue: Double = 10
    @State var opacity: Double = 0
    
    init(text:String, textSize: Double, startTime: Double, fontFamily: String, offSetValue: Double) {
        characters = Array(text)
        self.textSize = textSize
        self.startTime = startTime
        self.fontFamily = fontFamily
        self.offSetValue = offSetValue
    }
    
    var body: some View {
        HStack(spacing: 1){
            ForEach(0..<characters.count, id: \.self) { num in
                Text(String(self.characters[num]))
                    .font(.custom(self.fontFamily, fixedSize: textSize))
                    .blur(radius: blurValue)
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(num) * 0.15 ),
                               value: blurValue)
                    .offset(y: offSetValue)
            }
            .onAppear(){
                if blurValue == 0 {
                    blurValue = 10
                    opacity = 0.01
                } else {
                    blurValue = 0
                    opacity = 1
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + startTime) {
                if blurValue == 0{
                    blurValue = 10
                    opacity = 0.01
                } else {
                    blurValue = 0
                    opacity = 1
                }
            }
        }
    }
}
