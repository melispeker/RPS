//
//  ViewController.swift
//  RPS
//
//  Created by Melis Peker on 30.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
        // Do any additional setup after loading the view.
    }
    
    func updateUI (forState state:GameState){
        statusLabel.text = state.status
        switch state {
        case .start:
            view.backgroundColor = .gray
            signLabel.text = "🤖"
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        case .win:
            view.backgroundColor = state.color
        case .lose:
            view.backgroundColor = state.color
        case .draw:
            view.backgroundColor = state.color
        }
    }
    
    func play(userSign: Sign){
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        signLabel.text = computerSign.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        playAgainButton.isHidden = false
        
        switch userSign {
        case.rock:
            rockButton.isHidden = false
        case.paper:
            paperButton.isHidden = false
        case.scissors:
            scissorsButton.isHidden = false
        }
    }
}

