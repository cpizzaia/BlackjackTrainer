//
//  GameBoardView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import SwiftUI

struct GameBoardView: View {
  let hand: Hand
  let dealerHand: Hand
  let width: CGFloat

  var body: some View {
    content.frame(width: width, height: width * 2).background(Image("table_background"))
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 300
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }

  private var content: some View {
    VStack {
      DealerHandView(hand: dealerHand, width: width - 200 * sizeMultiplier)
      Spacer()
      Spacer()
      HandView(hand: hand, width: width - 200 * sizeMultiplier).padding(.bottom, 40 * sizeMultiplier)
      HStack(spacing: 50 * sizeMultiplier) {
        HandActionButtonView(action: .stand, width: 100 * sizeMultiplier)
        HandActionButtonView(action: .hit, width: 100 * sizeMultiplier)
      }.padding(.bottom, 20 * sizeMultiplier)
    }.frame(width: width)
  }
}

struct GameBoardView_Preview: PreviewProvider {
  static var previews: some View {
    GameBoardView(
      hand: .init(
        leftCard: .init(suit: .spades, value: .ace, visibility: .faceup),
        rightCard: .init(suit: .hearts, value: .king, visibility: .faceup)
      ),
      dealerHand: .init(
        leftCard: .init(suit: .spades, value: .ace, visibility: .faceup),
        rightCard: .init(suit: .hearts, value: .king, visibility: .facedown)
      ),
      width: 400
    )
  }
}
