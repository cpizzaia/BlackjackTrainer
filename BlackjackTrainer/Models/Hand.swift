//
//  Hand.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation

struct Hand {
  // MARK: Public Types
  enum Action: String {
    case hit = "Hit"
    case stand = "Stand"
    case split = "Split"
    case double = "Double"
    case surrender = "Surrender"
  }

  // MARK: Public Properties
  let leftCard: Card
  let rightCard: Card

  var cards: [Card] {
    [leftCard, rightCard]
  }

  var score: Int {
    let filteredAces = cards.filter { $0.value == .ace }
    let nonAces = cards.filter { $0.value != .ace }
    let cardsWithAcesInBack = nonAces + filteredAces

    return cardsWithAcesInBack.reduce(0) { currentResult, card in
      if card.value == .ace {
        if currentResult + 11 < 21 && filteredAces.count < 2 {
          return currentResult + 11
        } else {
          return currentResult + 1
        }
      }

      return currentResult + (card.score ?? 0)
    }
  }
}
