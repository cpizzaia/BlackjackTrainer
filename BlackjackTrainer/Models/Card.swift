//
//  Card.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftUI

struct Card: Equatable {
  enum Suit: String, CaseIterable {
    case hearts
    case spades
    case clubs
    case diamonds
  }

  enum Value: String, CaseIterable {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
  }

  enum Visibility {
    case faceup
    case facedown
  }

  let suit: Suit
  let value: Value
  let visibility: Visibility
  var score: Int? {
    switch value {
    case .ace: return nil
    case .two: return 2
    case .three: return 3
    case .four: return 4
    case .five: return 5
    case .six: return 6
    case .seven: return 7
    case .eight: return 8
    case .nine: return 9
    case .ten, .jack, .queen, .king: return 10
    }
  }

  var equivalentValue: Value {
    switch value {
    case .jack, .queen, .king:
      return .ten
    default:
      return value
    }
  }

  var image: Image {
    if visibility == .facedown { return Image("back_of_card") }

    switch (value, suit) {
    case (.two, .clubs):
      return Image("2_of_clubs")
    case (.two, .diamonds):
      return Image("2_of_diamonds")
    case (.two, .hearts):
      return Image("2_of_hearts")
    case (.two, .spades):
      return Image("2_of_spades")
    case (.three, .clubs):
      return Image("3_of_clubs")
    case (.three, .diamonds):
      return Image("3_of_diamonds")
    case (.three, .hearts):
      return Image("3_of_hearts")
    case (.three, .spades):
      return Image("3_of_spades")
    case (.four, .clubs):
      return Image("4_of_clubs")
    case (.four, .diamonds):
      return Image("4_of_diamonds")
    case (.four, .hearts):
      return Image("4_of_hearts")
    case (.four, .spades):
      return Image("4_of_spades")
    case (.five, .clubs):
      return Image("5_of_clubs")
    case (.five, .diamonds):
      return Image("5_of_diamonds")
    case (.five, .hearts):
      return Image("5_of_hearts")
    case (.five, .spades):
      return Image("5_of_spades")
    case (.six, .clubs):
      return Image("6_of_clubs")
    case (.six, .diamonds):
      return Image("6_of_diamonds")
    case (.six, .hearts):
      return Image("6_of_hearts")
    case (.six, .spades):
      return Image("6_of_spades")
    case (.seven, .clubs):
      return Image("7_of_clubs")
    case (.seven, .diamonds):
      return Image("7_of_diamonds")
    case (.seven, .hearts):
      return Image("7_of_hearts")
    case (.seven, .spades):
      return Image("7_of_spades")
    case (.eight, .clubs):
      return Image("8_of_clubs")
    case (.eight, .diamonds):
      return Image("8_of_diamonds")
    case (.eight, .hearts):
      return Image("8_of_hearts")
    case (.eight, .spades):
      return Image("8_of_spades")
    case (.nine, .clubs):
      return Image("9_of_clubs")
    case (.nine, .diamonds):
      return Image("9_of_diamonds")
    case (.nine, .hearts):
      return Image("9_of_hearts")
    case (.nine, .spades):
      return Image("9_of_spades")
    case (.ten, .clubs):
      return Image("10_of_clubs")
    case (.ten, .diamonds):
      return Image("10_of_diamonds")
    case (.ten, .hearts):
      return Image("10_of_hearts")
    case (.ten, .spades):
      return Image("10_of_spades")
    case (.jack, .clubs):
      return Image("jack_of_clubs")
    case (.jack, .diamonds):
      return Image("jack_of_diamonds")
    case (.jack, .hearts):
      return Image("jack_of_hearts")
    case (.jack, .spades):
      return Image("jack_of_spades")
    case (.queen, .clubs):
      return Image("queen_of_clubs")
    case (.queen, .diamonds):
      return Image("queen_of_diamonds")
    case (.queen, .hearts):
      return Image("queen_of_hearts")
    case (.queen, .spades):
      return Image("queen_of_spades")
    case (.king, .clubs):
      return Image("king_of_clubs")
    case (.king, .diamonds):
      return Image("king_of_diamonds")
    case (.king, .hearts):
      return Image("king_of_hearts")
    case (.king, .spades):
      return Image("king_of_spades")
    case (.ace, .clubs):
      return Image("ace_of_clubs")
    case (.ace, .diamonds):
      return Image("ace_of_diamonds")
    case (.ace, .hearts):
      return Image("ace_of_hearts")
    case (.ace, .spades):
      return Image("ace_of_spades")
    }
  }

  func flip(to visbility: Visibility) -> Card {
    return .init(suit: suit, value: value, visibility: visbility)
  }
}
