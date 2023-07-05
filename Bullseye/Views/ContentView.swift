//
//  ContentView.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/2/23.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.5
  @State private var game = Game()
  
  var body: some View {
    ZStack(alignment: .center) {
      BackgroundView(game: $game)

      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 160)
        if alertIsVisible {
          PointsView(alertIsVisibe: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitMeButton(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue)
            .transition(.scale)
        }
      }

      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderTextView(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
        .onAppear{
          let thumbImage = ImageRenderer(content: Thumb()).uiImage ?? UIImage()
          UISlider.appearance().setThumbImage(thumbImage, for: .normal)
        }
      SliderTextView(text: "100")
    }
    .padding()
  }
  
}

struct HitMeButton: View {
  
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  
  var body: some View {
    Button(action: {
      withAnimation {
        alertIsVisible = true
      }
    }, label: {
      Text("Hit me".uppercased())
        .font(.title3)
        .bold()
    })
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          colors: [Color.white.opacity(0.3), Color.clear],
          startPoint: .top,
          endPoint: .bottom
        )
      }
    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color("ButtonFilledBackground"), lineWidth: Constants.General.strokeWidth)
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView()
    
    ContentView()
      .previewInterfaceOrientation(.landscapeLeft)
    
    ContentView()
      .preferredColorScheme(.dark)
    
    ContentView()
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeLeft)
  }
  
}
