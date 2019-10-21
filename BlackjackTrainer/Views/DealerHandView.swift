//
//  DealerHandView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/20/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftUI

struct DealerHandView: View {
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

struct DealerHandView_Preview: PreviewProvider {
  static var previews: some View {
    DealerHandView(
      hand: .init(
        leftCard: .init(
          suit: .clubs,
          value: .ace,
          visibility: .faceup
        ),
        rightCard: .init(
          suit: .spades,
          value: .king,
          visibility: .facedown
        )
      ),
      width: 300
    )
  }
}
