//
//  HandAnalyzer.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/19/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation

enum HandAnalyzer {
  func execute(hand: Hand, dealerFaceupCard: Card, doubleAllowed: Bool, doubleAfterSplitAllowed: Bool) -> Hand.Action {
    let shouldSplit = PairSplitAnaylzer.execute(
      hand: hand,
      dealerFaceupCard: dealerFaceupCard,
      doubleAfterSplitAllowed: doubleAfterSplitAllowed
    )

    if shouldSplit { return .split }

    let resultFromSoftTotal = SoftTotalAnalyzer.execute(hand: hand, dealerFaceupCard: dealerFaceupCard, doubleAllowed: doubleAllowed)

    return resultFromSoftTotal ?? HardTotalAnalyzer.execute(hand: hand, dealerFaceupCard: dealerFaceupCard, doubleAllowed: doubleAllowed)
  }
}

enum HardTotalAnalyzer {
  static func execute(hand: Hand, dealerFaceupCard: Card, doubleAllowed: Bool) -> Hand.Action {
    let handScore = hand.score

    let doubleOrHit: Hand.Action = doubleAllowed ? .double : .hit

    switch (handScore, dealerFaceupCard.equivalentValue) {
    case (21, _): return .stand
    case (20, _): return .stand
    case (19, _): return .stand
    case (18, _): return .stand
    case (17, _): return .stand
    case (16, .two), (16, .three), (16, .four), (16, .five), (16, .six): return .stand
    case (16, _): return .hit
    case (15, .two), (15, .three), (15, .four), (15, .five), (15, .six): return .stand
    case (15, _): return .hit
    case (14, .two), (14, .three), (14, .four), (14, .five), (14, .six): return .stand
    case (14, _): return .hit
    case (13, .two), (13, .three), (13, .four), (13, .five), (13, .six): return .stand
    case (13, _): return .hit
    case (12, .four), (12, .five), (12, .six): return .stand
    case (12, _): return .hit
    case (11, _): return doubleOrHit
    case (10, .ten), (10, .ace): return .hit
    case (10, _): return doubleOrHit
    case (9, .three), (9, .four), (9, .five), (9, .six): return doubleOrHit
    case (9, _): return .hit
    case (8, _): return .hit
    case (7, _): return .hit
    case (6, _): return .hit
    case (5, _): return .hit
    case (4, _): return .hit
    default: return .stand
    }
  }
}

enum SoftTotalAnalyzer {
  static func execute(hand: Hand, dealerFaceupCard: Card, doubleAllowed: Bool) -> Hand.Action? {
    let handHasNoAce = hand.cards.allSatisfy { $0.value != .ace }
    let handHasTwoAces = hand.cards.allSatisfy { $0.value == .ace }
    let handHasMoreThanTwoCards = hand.cards.count > 2

    if handHasNoAce || handHasTwoAces || handHasMoreThanTwoCards {
      return nil
    }

    guard let cardThatsNotTheAce = hand.cards.first(where: { $0.value != .ace }) else { return nil }

    let doubleOrStand: Hand.Action = doubleAllowed ? .double : .stand
    let doubleOrHit: Hand.Action = doubleAllowed ? .double : .hit

    switch (cardThatsNotTheAce.equivalentValue, dealerFaceupCard.equivalentValue) {
    case (.nine, _): return .stand
    case (.eight, .six): return doubleOrStand
    case (.eight, _): return .stand
    case (.seven, .two): return doubleOrStand
    case (.seven, .three): return doubleOrStand
    case (.seven, .four): return doubleOrStand
    case (.seven, .five): return doubleOrStand
    case (.seven, .six): return doubleOrStand
    case (.seven, .seven): return doubleOrStand
    case (.seven, .eight): return .stand
    case (.seven, .nine): return .stand
    case (.seven, _): return .hit
    case (.five, .four): return doubleOrHit
    case (.five, .five): return doubleOrHit
    case (.five, .six): return doubleOrHit
    case (.five, _): return .hit
    case (.four, .four): return doubleOrHit
    case (.four, .five): return doubleOrHit
    case (.four, .six): return doubleOrHit
    case (.four, _): return .hit
    case (.three, .five): return doubleOrHit
    case (.three, .six): return doubleOrHit
    case (.three, _): return .hit
    case (.two, .five): return doubleOrHit
    case (.two, .six): return doubleOrHit
    case (.two, _): return .hit
    default: return nil
    }
  }
}

enum PairSplitAnaylzer {
  static func execute(hand: Hand, dealerFaceupCard: Card, doubleAfterSplitAllowed: Bool) -> Bool {
    if hand.leftCard.equivalentValue != hand.rightCard.equivalentValue { return false }
    let myCard = hand.leftCard
    switch (myCard.equivalentValue, dealerFaceupCard.equivalentValue) {
    case (.ace, _): return true
    case (.nine, .two): return true
    case (.nine, .three): return true
    case (.nine, .four): return true
    case (.nine, .five): return true
    case (.nine, .six): return true
    case (.nine, .eight): return true
    case (.nine, .nine): return true
    case (.eight, _): return true
    case (.seven, .two): return true
    case (.seven, .three): return true
    case (.seven, .four): return true
    case (.seven, .five): return true
    case (.seven, .six): return true
    case (.seven, .seven): return true
    case (.six, .two): return doubleAfterSplitAllowed
    case (.six, .three): return true
    case (.six, .four): return true
    case (.six, .five): return true
    case (.six, .six): return true
    case (.four, .five): return doubleAfterSplitAllowed
    case (.four, .six): return doubleAfterSplitAllowed
    case (.three, .two): return doubleAfterSplitAllowed
    case (.three, .three): return doubleAfterSplitAllowed
    case (.three, .four): return true
    case (.three, .five): return true
    case (.three, .six): return true
    case (.three, .seven): return true
    case (.two, .two): return doubleAfterSplitAllowed
    case (.two, .three): return doubleAfterSplitAllowed
    case (.two, .four): return true
    case (.two, .five): return true
    case (.two, .six): return true
    case (.two, .seven): return true
    default: return false
    }
  }
}
