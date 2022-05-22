//
//  ViewController.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/4/22.
//

import UIKit

class ChenGameViewController: UIViewController {
    var highScore = 0
    var gameDataDict: [String: Bool] = [:]
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
        gameView.initializeArr(Array(gameDataDict.keys))
        gameView.updateSubviews(Array(gameDataDict.keys), score: highScore)
        
    }
    @objc func buttonTapped(sender: ChenGameButton) {
        guard let buttonText = sender.titleLabel?.text, let hand = gameDataDict[buttonText] else {
            print("Button text is nil")
            return
        }
        if (hand == true) {
            highScore += 1
            gameRun()
        } else {
            highScore = 0
            gameRun()
        }
        sender.hapticExtraHeavy()
        sender.shake()
    }

}
