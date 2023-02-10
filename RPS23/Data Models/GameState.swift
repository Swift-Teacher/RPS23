//
//  GameState.swift
//  RPS23
//
//  Created by Brian Foutty on 2/2/23.
//  #4 - create this Swift file as the data file to track where the user is in the game progression.

import Foundation

// #5 - create an enum named the same as the file name. There needs to be a case for each game outcome and the start of the game.
enum GameState {
    case start, win, lose, draw
    
    // #6 - create a conditional using 'switch' to return the outcome based upon a comparison method we will put in the Sign file.
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
