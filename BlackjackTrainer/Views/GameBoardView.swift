//
//  GameBoardView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import SwiftUI

struct GameBoardView: View {
  let playerHand: Hand?
  let dealerHand: Hand?
  let width: CGFloat
  let height: CGFloat
  let hitTapAction: () -> Void

  var body: some View {
    content.frame(
      width: width,
      height: height
    ).background(Image("table_background"))
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 300
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }

  private var content: some View {
    VStack {
      dealerHandView()

      Spacer()
      Spacer()

      playerHandView()

      HStack(spacing: 50 * sizeMultiplier) {
        HandActionButtonView(
          tapAction: {},
          action: .stand,
          width: 100 * sizeMultiplier
        )
        HandActionButtonView(
          tapAction: hitTapAction,
          action: .hit,
          width: 100 * sizeMultiplier
        )
      }.padding(.bottom, 20 * sizeMultiplier)
    }.frame(width: width)
  }

  private func dealerHandView() -> AnyView {
    if let dealerHand = dealerHand {
      return AnyView(DealerHandView(
        hand: dealerHand,
        width: width - 200 * sizeMultiplier
      ))
    }

    return AnyView(EmptyView())
  }

  private func playerHandView() -> AnyView {
    if let playerHand = playerHand {
      return AnyView(HandView(
        hand: playerHand,
        width: width - 200 * sizeMultiplier
      ).padding(.bottom, 40 * sizeMultiplier))
    }

    return AnyView(EmptyView())
  }
}

struct GameBoardView_Preview: PreviewProvider {
  static var previews: some View {
    let topPadding = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.top ?? 0

    return GameBoardView(
      playerHand: .init(
        leftCard: .init(suit: .spades, value: .ace, visibility: .faceup),
        rightCard: .init(suit: .hearts, value: .king, visibility: .faceup)
      ),
      dealerHand: .init(
        leftCard: .init(suit: .spades, value: .ace, visibility: .faceup),
        rightCard: .init(suit: .hearts, value: .king, visibility: .facedown)
      ),
      width: UIScreen.main.bounds.width,
      height: UIScreen.main.bounds.height - topPadding,
      hitTapAction: {}
    ).padding(.top, topPadding)
  }
}
