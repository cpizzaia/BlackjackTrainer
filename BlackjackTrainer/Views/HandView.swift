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
    content.frame(width: width, height: width / 2)
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 200
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }
  private var content: some View {
    HStack {
      CardView(card: hand.leftCard, width: 100 * sizeMultiplier)
      Spacer()
      CardView(card: hand.rightCard, width: 100 * sizeMultiplier)
    }
  }
}

struct HandView_Preview: PreviewProvider {
  static var previews: some View {
    HandView(
      hand: .init(
        leftCard: .init(suite: .spades, value: .ace),
        rightCard: .init(suite: .hearts, value: .king)
      ),
      width: 200
    )
  }
}
