//
//  ViewController.swift
//  RPS23
//
//  Created by Brian Foutty on 2/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var oppoenentSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: - Instance Properties
    
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
    }
    
    // MARK: - IB Actions
    @IBAction func rockChosen(_ sender: UIButton) {
        play(userSign: .rock)
    }
    
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func playAgainTapped(_ sender: Any) {
        updateUI(forState: .start)
    }
    // MARK: - Instance Methods
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

