//
//  AppView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/20/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftUI

struct AppView: View {
  @ObservedObject var state = AppState()

  var body: some View {
    let topPadding = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.top ?? 0
    return GameBoardView(
      playerHand: state.playerHand,
      dealerHand: state.dealerHand,
      width: UIScreen.main.bounds.width,
      height: UIScreen.main.bounds.height - topPadding,
      hitTapAction: state.dealNewHands
    ).padding(.top, topPadding)
  }
}

struct AppView_Preview: PreviewProvider {
  static var previews: some View {
    AppView()
  }
}
