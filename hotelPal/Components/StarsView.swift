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

struct StarsView: View {
  private static let MAX_RATING: Double = 5 // Defines upper limit of the rating
  private static let COLOR = Color.orange // The color of the stars

  let rating: Double
  private let fullCount: Int
  private let emptyCount: Int
  private let halfFullCount: Int

  init(rating: Double) {
    self.rating = rating
    fullCount = Int(rating)
    emptyCount = Int(StarsView.MAX_RATING - rating)
    halfFullCount = (Double(fullCount + emptyCount) < StarsView.MAX_RATING) ? 1 : 0
  }

  var body: some View {
    HStack {
        ForEach(0..<fullCount, id: \.self) { _ in
         self.fullStar
       }
        ForEach(0..<halfFullCount, id: \.self) { _ in
         self.halfFullStar
       }
        ForEach(0..<emptyCount, id: \.self) { _ in
         self.emptyStar
       }
     }
  }

  private var fullStar: some View {
    Image(systemName: "star.fill").foregroundColor(StarsView.COLOR)
  }

  private var halfFullStar: some View {
    Image(systemName: "star.lefthalf.fill").foregroundColor(StarsView.COLOR)
  }

  private var emptyStar: some View {
    Image(systemName: "star").foregroundColor(StarsView.COLOR)
  }
}
