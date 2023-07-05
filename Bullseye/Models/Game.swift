//
//  Game.swift
//  Bullseye
//
//  Created by Dmitrii Tikhomirov on 7/3/23.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1..<100)
  var score = 0
  var round = 1

  var leaderboardEntries: [LeaderboardEntry] = []

  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 300, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 400, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 540, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 60, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 70, date: Date()))
    }
  }

  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    if difference == 0 {
      return 200
    } else if difference <= 2 {
      return 100 - abs(sliderValue - target) + 50
    } else {
      return 100 - abs(sliderValue - target)
    }
  }

  mutating func addToLeaderboard(points: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }

  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1..<100)
    addToLeaderboard(points: points)
  }

  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1..<100)
  }

}
