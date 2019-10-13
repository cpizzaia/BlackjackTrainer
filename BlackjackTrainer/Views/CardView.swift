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
    content.border(Color.black, width: 5 * sizeMultiplier)
      .frame(width: width, height: width / 0.714)
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 300
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }
  private var content: some View {
    VStack {
      HStack {
        Text(card.value.rawValue).font(.myFont(size: 40 * sizeMultiplier)).padding(.init(10 * sizeMultiplier))
        Spacer()
      }
      Spacer()
      Text(card.suite.rawValue).font(.myFont(size: 30 * sizeMultiplier))
      Spacer()
      HStack {
        Spacer()
        Text(card.value.rawValue).font(.myFont(size: 40 * sizeMultiplier)).padding(.init(10 * sizeMultiplier))
      }
    }
  }
}

struct CardView_Preview: PreviewProvider {
  static var previews: some View {
    return CardView(
      card: .init(suite: .spades, value: .ace),
      width: 300
    )
  }
}
