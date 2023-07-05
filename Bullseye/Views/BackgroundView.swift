//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/3/23.
//

import SwiftUI

struct BackgroundView: View {
  
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
  
}

struct RingsView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      ForEach(1..<10) { ring in
        let size = CGFloat(100 * ring)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(
              colors: [Color("RingColor").opacity(0.8 * opacity),
                       Color("RingColor").opacity(0)],
              center: .center,
              startRadius: 100,
              endRadius: 400)
          )
          .frame(width: size, height: size)
      }
    }
  }
  
}

struct TopView: View {
  
  @Binding var game: Game
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      })
      {
        RoundedViewsStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        leaderboardIsShowing = true
      })
      {
        RoundedViewsFilled(systemName: "list.dash")
      }
      .sheet(
        isPresented: $leaderboardIsShowing,
        onDismiss: {},
        content: {
          LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
        }
      )
    }
  }
  
}

struct BottomView: View {
  
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
  
}

struct NumberView: View {
  
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5.0) {
      LabelTextView(text: title)
      RoundRectTextView(text: text)
    }
    
  }
  
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
