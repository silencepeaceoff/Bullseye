//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/3/23.
//

import SwiftUI

struct RoundedViewsStroked: View {
  
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TitleLabelColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
  
}

struct RoundedViewsFilled: View {
  
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewHeight)
      .background(Color("ButtonFilledBackground"))
      .cornerRadius(Constants.General.roundedViewHeight / 2)
      .foregroundColor(Color("ButtonFilledTextColor"))
  }
  
}

struct RoundRectTextView: View {

  var text: String

  var body: some View {
    Text(text)
      .foregroundColor(Color("TitleLabelColor"))
      .multilineTextAlignment(.center)
      .kerning(-0.2)
      .font(.title3)
      .bold()
      .frame(width: Constants.General.roundedViewWidth, height: Constants.General.roundedViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }

}

struct RoundedTextView: View {

  var number: String

  var body: some View {
    Text(number)
      .font(.title3)
      .fontWeight(.bold)
      .foregroundColor(Color("TitleLabelColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
  }

}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedViewsStroked(systemName: "arrow.counterclockwise")
      RoundedViewsStroked(systemName: "list.dash")
      RoundedViewsFilled(systemName: "arrow.counterclockwise")
      RoundedViewsFilled(systemName: "list.dash")
      RoundRectTextView(text: "999")
      RoundedTextView(number: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
