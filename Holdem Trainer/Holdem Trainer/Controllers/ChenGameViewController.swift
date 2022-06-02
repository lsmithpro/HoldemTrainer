//
//  ViewController.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/4/22.
//

import UIKit
import Logging


class ChenGameViewController: UIViewController {
    var highScore = 0
    var gameDataDict: [String: Bool] = [:]
    var gameScoreStored = DataManager.shared.find(with: "ChenGame")
    let chenGame = ChenGuesserGame()
    let buttonArray = 0
    let gameView = ChenGameView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        
        gameView.buttonOne.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        gameView.buttonTwo.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        gameView.buttonThree.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        gameRun()
        
    
    }
    
    
    func gameRun()  {
        gameDataDict = chenGame.RunGame()
        Logger.info.info("Initializing Subviews with \(gameDataDict.keys)")
        gameView.initializeArr(Array(gameDataDict.keys))
        Logger.info.info("Updating Subviews with \(gameDataDict.keys)")
        gameView.updateSubviews(Array(gameDataDict.keys), score: highScore)
        
    }
 
        
        
    
    @objc func buttonTapped(sender: ChenGameButton) {
        guard let buttonText = sender.titleLabel?.text, let hand = gameDataDict[buttonText] else {
            print("Button text is nil")
            return
        }
        gameScoreStored?.attempts += 1
        if (hand == true) {
            highScore += 1
            gameScoreStored?.correct += 1
            gameRun()
            
        } else {
            highScore = 0
            gameRun()
        }
        do {
            try DataManager.shared.update(gameScore: gameScoreStored!)
        } catch {
            print("Could not update Game data")
        }
        sender.hapticExtraHeavy()
        sender.shake()
    }

}

