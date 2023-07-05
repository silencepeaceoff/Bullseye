//
//  Shapes.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/3/23.
//

import SwiftUI

struct Shapes: View {

  @State private var wideShapes = true

  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
          .strokeBorder(.blue, lineWidth: 20)
          .frame(width: 200, height: 100)
          .transition(.slide)
      }
      RoundedRectangle(cornerRadius: 20)
        .fill(.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
        .animation(.default)
      Capsule()
        .fill(.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Ellipse()
        .fill(.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Button("Animate!", action: {
        withAnimation {
          wideShapes.toggle()
        }
      })
    }
    .background(.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
