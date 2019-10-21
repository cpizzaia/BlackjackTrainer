//
//  HandActionButtonView.swift
//  BlackjackTrainer
//
//  Created by Cody Pizzaia on 10/12/19.
//  Copyright © 2019 Cody Pizzaia. All rights reserved.
//

import SwiftUI

struct HandActionButtonView: View {
  // MARK: Public Properties
  let action: Hand.Action
  let width: CGFloat

  var body: some View {
    content.frame(
      width: width,
      height: width / 2
    ).border(Color.white, width: 3 * sizeMultiplier)
  }

  // MARK: Private Properties
  private let designedWidth: CGFloat = 100
  private var sizeMultiplier: CGFloat {
    return width / designedWidth
  }

  private var content: some View {
    Group {
      Text(action.rawValue.uppercased()).font(.myFont(size: 20 * sizeMultiplier)).foregroundColor(.white)
    }
  }
}

struct HandActionButtonView_Preview: PreviewProvider {
  static var previews: some View {
    GeometryReader(content: { geometry in
      VStack {
        HandActionButtonView(action: .hit, width: 200)
      }
    }).background(Color.black).edgesIgnoringSafeArea(.all)
  }
}
