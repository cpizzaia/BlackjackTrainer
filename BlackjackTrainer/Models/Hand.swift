//
//  Hand.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation

struct Hand {
  enum Action: String {
    case hit = "Hit"
    case stand = "Stand"
    case split = "Split"
    case double = "Double"
    case surrender = "Surrender"
  }

  let leftCard: Card
  let rightCard: Card
}
