//
//  PointsView.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/4/23.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var alertIsVisibe: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    
    VStack(spacing: 10) {
      InstructionText(text: "the sliders value is")
      BigNumberText(text: "\(roundedValue)")
      AlertText(text: "You scored \(points) Points\n 🎉🎉🎉")
      Button(action: {
        game.startNewRound(points: points)
        withAnimation {
          alertIsVisibe = false
        }
      })
      {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
    .transition(.scale)
  }
  
}

struct PointsView_Previews: PreviewProvider {
  
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.5)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    PointsView(alertIsVisibe: alertIsVisible, sliderValue: sliderValue, game: game)
    
    PointsView(alertIsVisibe: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewInterfaceOrientation(.landscapeLeft)
    
    PointsView(alertIsVisibe: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
    
    PointsView(alertIsVisibe: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeLeft)
  }
  
}
