//
//  Card.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation

struct Card {
  enum Suite: String {
    case hearts = "Hearts"
    case spades = "Spades"
    case clubs = "Clubs"
    case diamonds = "Diamonds"
  }

  enum Value: String {
    case ace = "Ace"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
  }

  let suite: Suite
  let value: Value
}
