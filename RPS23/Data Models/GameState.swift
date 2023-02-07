//
//  GameState.swift
//  RPS23
//
//  Created by Brian Foutty on 2/2/23.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You won! 🥳"
        case .lose:
            return "Sorry you're a loser! 😢"
        case .draw:
            return "It's a draw. 😑"
        }
    }
}
