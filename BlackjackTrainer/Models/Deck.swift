//
//  Deck.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/20/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation

struct Deck {
  // MARK: Public Static Methods
  static var standardDeck: Deck {
    var cards = [Card]()

    Card.Value.allCases.forEach { value in
      Card.Suit.allCases.forEach { suite in
        cards.append(.init(suit: suite, value: value, visibility: .facedown))
      }
    }

    return .init(cards: cards)
  }

  // MARK: Public Properties
  let cards: [Card]

  // MARK: Public Methods
  func shuffled() -> Deck {
    return Deck(cards: cards.shuffled())
  }

  func draw() -> (card: Card, deck: Deck)? {
    guard let firstCard = cards.first else { return nil }

    let newCards = Array(cards[1...])

    return (firstCard, .init(cards: newCards))
  }
}
