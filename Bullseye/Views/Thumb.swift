//
//  Thumb.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/3/23.
//

import SwiftUI

struct Thumb: View {
  
  var body: some View {
    ZStack {
      Circle()
        .frame(width: 68, height: 68)
        .foregroundColor(.white)
      
      ForEach(1..<4) {ring in
        let size = CGFloat(ring * 20)
        Circle()
          .stroke(lineWidth: 6)
          .frame(width: size)
          .foregroundColor(Color("AccentColor"))
      }
    }
  }
  
}

struct Thumb_Previews: PreviewProvider {
  static var previews: some View {
    Thumb()
  }
}
