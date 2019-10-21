//
//  HandView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import SwiftUI

struct HandView: View {
  // MARK: Public Properties
  let hand: Hand
  let width: CGFloat
  var body: some View {
    content.frame(width: width)
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 200
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }
  private var content: some View {
    let cardWidth = 140 * sizeMultiplier
    return VStack(spacing: -140 * sizeMultiplier) {
      HStack() {
        Spacer()
        CardView(card: hand.leftCard, width: cardWidth)
      }.zIndex(1).frame(width: width)
      HStack {
        CardView(card: hand.rightCard, width: cardWidth)
        Spacer()
      }.frame(width: width)
    }.frame(width: width)
  }
}

struct HandView_Preview: PreviewProvider {
  static var previews: some View {
    HandView(
      hand: .init(
        leftCard: .init(suit: .spades, value: .ace, visibility: .faceup),
        rightCard: .init(suit: .hearts, value: .king, visibility: .faceup)
      ),
      width: 400
    )
  }
}
