//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/4/23.
//

import SwiftUI

struct LeaderboardView: View {

  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: 10) {
        TitleView(leaderboardIsShowing: $leaderboardIsShowing)
          .padding(.bottom)
        LabelView()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices) { index in
              let leaderboardEntry = game.leaderboardEntries[index]
              RowView(
                index: index,
                score: leaderboardEntry.score,
                date: leaderboardEntry.date
              )
            }
          }
        }
      }
    }
  }

}


struct TitleView: View {

  @Binding var leaderboardIsShowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass

  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == . regular && horizontalSizeClass == .compact {
          TitleText(title: "leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          TitleText(title: "leaderboard")
        }
      }
      .padding(.top)
      HStack {
        Spacer()
        Button(action: {
          leaderboardIsShowing = false
        }) {
          RoundedViewsFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }

}

struct LabelView: View {

  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelTextView(text: "score")
        .frame(width: Constants.Leaderboard.scoreColWidth)
      Spacer()
      LabelTextView(text: "date")
        .frame(width: Constants.Leaderboard.dateColWidth)
    }
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    .padding(10)
  }

}

struct RowView: View {

  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
      RoundedTextView(number: String(index))
      Spacer()
      ScoreText(score: score)
      Spacer()
      DateText(date: date)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(
          Color("LeaderboardRowColor"),
          lineWidth: Constants.General.strokeWidth
        )
    )
    .padding([.leading, .trailing])
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }

}

struct LeaderboardView_Previews: PreviewProvider {

  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))

  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    //    LabelView()
    //    RowView(index: 1, score: 889, date: .now)

    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewInterfaceOrientation(.landscapeLeft)

    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)

    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeLeft)
  }

}
