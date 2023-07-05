//
//  TextViews.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/3/23.
//

import SwiftUI

struct InstructionText: View {
  
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .foregroundColor(Color("TitleLabelColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .kerning(2.0)
      .font(.footnote)
  }
  
}

struct BigNumberText: View {
  
  var text: String
  
  var body: some View {
    
    Text(text)
      .font(.largeTitle)
      .foregroundColor(Color("TitleLabelColor"))
      .fontWeight(.black)
      .kerning(-1.0)
  }
  
}

struct SliderTextView: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TitleLabelColor"))
      .font(.body)
      .fontWeight(.bold)
      .frame(width: 40)
  }
  
}

struct LabelTextView: View {

  var text: String

  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TitleLabelColor"))
      .font(.caption)
      .fontWeight(.bold)
      .kerning(1.5)
  }

}

struct AlertText: View {

  var text: String

  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .foregroundColor(Color("TitleLabelColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }

}

struct ButtonText: View {

  var text: String

  var body: some View {
    Text(text.uppercased())
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color("AccentColor")
      )
      .cornerRadius(12.0)
      .fontWeight(.bold)
      .foregroundColor(.white)
      .multilineTextAlignment(.center)
      .font(.body)
  }

}

struct ScoreText: View {

  var score: Int

  var body: some View {
    Text(String(score))
      .font(.title3)
      .fontWeight(.bold)
      .foregroundColor(Color("TitleLabelColor"))
      .kerning(-0.2)
      .frame(width: Constants.Leaderboard.scoreColWidth)
  }

}

struct DateText: View {

  var date: Date

  var body: some View {
    Text(date, style: .time)
      .font(.title3)
      .fontWeight(.bold)
      .foregroundColor(Color("TitleLabelColor"))
      .kerning(-0.2)
      .frame(width: Constants.Leaderboard.dateColWidth)
  }

}

struct TitleText: View {

  var title: String

  var body: some View {
    Text(title.uppercased())
      .font(.title)
      .fontWeight(.black)
      .foregroundColor(Color("TitleLabelColor"))
      .kerning(2.0)
  }

}

struct TextViews_Previews: PreviewProvider {
  
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderTextView(text: "100")
      LabelTextView(text: "Score")

      InstructionText(text: "the sliders value is")
      BigNumberText(text: "99")
      AlertText(text: "You scored 200 Points\n 🎉🎉🎉")
      ButtonText(text: "Start New Round")

//      ScoreText(score: 889)
      DateText(date: .now)
      TitleText(title: "leaderboard")
    }
    .padding()
  }
  
}
