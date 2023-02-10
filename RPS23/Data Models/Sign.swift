//
//  Sign.swift
//  RPS23
//
//  Created by Brian Foutty on 2/2/23.
// #1 - create this Swift data file named Sign because the enum will be named the same. This is an iOS app dev convention.
//
// #8 - Build the UI next. This is covered in Apple's "App Development with Swift Explorations" book: https://books.apple.com/us/book/develop-in-swift-explorations/id1581182728
// Building the UI section starts on page 377 in the student book. I put the rock, paper, and scissors buttons in a horizontal stack view and all of the elements in a vertical stack view so that the lesson can be extended to add lizard and spock choices for the next part of the project (https://github.com/Swift-Teacher/RPSLS).

import Foundation

// #7 - create this instance method to generate a random number and assign the random number to a specific Sign type for each game choice. We did this in the Python version by creating them as a Python list and generating the random number and assigning it the list.
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

// #2 - create the Sign enum with cases for each game choice
enum Sign {
    
    case rock, paper, scissors
    
    // #3  - switch statement for conditional since enums and switch statements both use 'case'. Add a case for each game choice.
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func gameState(against computerSign: Sign) -> GameState {
        if self == computerSign {
            return .draw
        }
        
        switch self {
        case .rock:
            if computerSign == .scissors {
                return .win
            }
        case .paper:
            if computerSign == .rock {
                return .win
            }
        case .scissors:
            if computerSign == .paper {
                return .win
            }
        }
        return .lose
    }
}
