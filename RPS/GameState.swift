//
//  GameState.swift
//  RPS
//
//  Created by Melis Peker on 30.09.2024.
//

import Foundation
import UIKit
enum GameState{
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock,Paper,Scissors!"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lose!"
        case .draw:
            return "It's a Draw!"
        }
    }
    
    var color: UIColor {
        switch self {
        case .start:
            return UIColor.blue
        case .win:
            return UIColor.green
        case . lose:
            return UIColor.red
        case .draw:
            return UIColor.yellow
            }
        }
    }

