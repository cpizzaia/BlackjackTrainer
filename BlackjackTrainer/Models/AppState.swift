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
  @Published var deck = Deck.standardDeck

  func dealNewHands() {

  }
}
