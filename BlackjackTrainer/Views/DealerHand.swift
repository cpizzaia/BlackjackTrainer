//
//  DealerHand.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/20/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftUI

struct DealerHand: View {
  let hand: Hand
  let width: CGFloat

  let designedWidth: CGFloat = 300

  var body: some View {
    content.frame(width: width)
  }

  private var sizeMultiplier: CGFloat {
    width / designedWidth
  }

  private var content: some View {
    let spacing: CGFloat = -60 * sizeMultiplier
    let cardWidth: CGFloat = width / 2 - spacing / 2
    return HStack(spacing: spacing) {
      CardView(card: hand.leftCard, width: cardWidth).zIndex(1)
      CardView(card: hand.rightCard, width: cardWidth)
    }
  }
}

struct DealerHand_Preview: PreviewProvider {
  static var previews: some View {
    DealerHand(
      hand: .init(
        leftCard: .init(
          suite: .clubs,
          value: .ace,
          visibility: .faceup
        ),
        rightCard: .init(
          suite: .spades,
          value: .king,
          visibility: .facedown
        )
      ),
      width: 300
    )
  }
}
