//
//  ViewController.swift
//  RPS23
//
//  Created by Brian Foutty on 2/2/23.
//  #9 - I add PRAGMA marks to put this code file in sections so that we can move to the different sections of this file more easily using the jump bar.
// The PRAGMA marks also help teach about the different parts of ViewController class file and how the compiler perceives our control-drags.

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    // #10 - control-drag to create outlets for labels and buttons so that we can access their properties
    @IBOutlet weak var oppoenentSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: - Instance Properties
    // This section is not needed yet, but will be used to extend this project to Rock Paper Scissors Lizard Spock.
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        // #13 - add the call to updateUI method
        updateUI(forState: .start)
    }
    
    // MARK: - IB Actions
    @IBAction func rockChosen(_ sender: UIButton) {
        // #16 - call the play method for .rock
        play(userSign: .rock)
    }
    
    
    @IBAction func paperChosen(_ sender: Any) {
        // #17 - call the play method for .paper
        play(userSign: .paper)
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
        // #18 - call the play method for .scissors
        play(userSign: .scissors)
    }
    
    @IBAction func playAgainTapped(_ sender: Any) {
        // #14 - add a call to the updateUI method to start the game over again
        updateUI(forState: .start)
    }
    // MARK: - Instance Methods
    // #11 - method to update the user interface for the start of the game, playing the game again to start the game over, and for each outcome of playing the game: win, lose, draw
    func updateUI(forState state: GameState) {
        gameStatusLabel.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .gray
            
            oppoenentSignLabel.text = "🦄"
            playAgainButton.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
            //view.backgroundColor = .green
        case .lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
            //view.backgroundColor = .red
        case .draw:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
            //view.backgroundColor = .yellow
        }
    }
    // #12 - Have students build and run the app and ask them 'Why didn't UI update from the generic layout we built in the Main file?'
    // We want them to figure out that we created the method, but never called it in the ViewDidLoad method which fires every time the app starts which we be necessary to start the game.
    
    // #15 - method to play the game. It will generate a random Sign for the computer, compare the user's and computer's sign, update the UI, hide and disable the rock, paper, scissors buttons, and show the 'Play Again' button
    func play(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        
        oppoenentSignLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
}

