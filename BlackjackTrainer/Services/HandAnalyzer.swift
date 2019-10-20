//
//  HandAnalyzer.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/19/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation

enum HandAnalyzer {

}

enum HardTotalAnalyzer {

}

enum SoftTotalAnalyzer {

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
