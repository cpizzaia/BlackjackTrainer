//
//  AppState.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/20/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftUI

class AppState: ObservableObject {
  @Published var dealerHand: Hand?
  @Published var playerHand: Hand?
  @Published var deck = Deck.standardDeck.shuffled()

  func dealNewHands() {
    guard let drawResult1 = deck.draw() else { return }
    guard let drawResult2 = drawResult1.deck.draw() else { return }
    guard let drawResult3 = drawResult2.deck.draw() else { return }
    guard let drawResult4 = drawResult3.deck.draw() else { return }

    playerHand = .init(
      leftCard: drawResult1.card.flip(to: .faceup),
      rightCard: drawResult2.card.flip(to: .faceup)
    )

    dealerHand = .init(
      leftCard: drawResult3.card.flip(to: .faceup),
      rightCard: drawResult4.card.flip(to: .facedown)
    )

    deck = drawResult4.deck
  }
}
