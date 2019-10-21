//
//  CardView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import SwiftUI

struct CardView: View {
  // MARK: Public Properties
  let card: Card
  let width: CGFloat
  var body: some View {
    content.frame(width: width, height: width / 0.714)
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 300
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }

  private var content: some View {
    card.image.resizable()
  }
}

struct CardView_Preview: PreviewProvider {
  static var previews: some View {
    return CardView(
      card: .init(suit: .spades, value: .ace, visibility: .faceup),
      width: 300
    )
  }
}
