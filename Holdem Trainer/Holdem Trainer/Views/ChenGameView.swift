//
//  ChenGameView.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/7/22.
//

import UIKit
import SnapKit
import Logging

class ChenGameView: UIView {
    let stackView = UIStackView()
    var scorelabel = UILabel()
   
    var handArray = [String]()
    var buttonOne = ChenGameButton()
    var buttonTwo = ChenGameButton()
    var buttonThree = ChenGameButton()
    var buttonArray = [ChenGameButton]()
    
    
    
    override init(frame: CGRect) {
        Logger.viewCycle.info("Chen View initialized")
        super.init(frame: frame)
        createSubviews()
        self.backgroundColor = UIColor(red: 99/255, green: 149/255, blue: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        Logger.viewCycle.info("Chen View initialized")
        super.init(coder: aDecoder)
        createSubviews()
    }
   
    
    func createSubviews() {
        self.addSubview(stackView)
        buttonArray = [buttonOne, buttonTwo, buttonThree]
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
        }
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 16
        buttonStack.distribution = .fillEqually
        for button in buttonArray {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 16
            //button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            //button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.setupButton()
            horizontalStack.addArrangedSubview(button)
            buttonStack.addArrangedSubview(horizontalStack)
        }
        
        
      
        
  
     
        scorelabel.textAlignment = .center
        scorelabel.text = "0"
        scorelabel.font = scorelabel.font.withSize(100)
        
        
        
        
        stackView.addArrangedSubview(buttonStack)
        stackView.addArrangedSubview(scorelabel)
       
    
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
    }
    func initializeArr(_ hands: [String]) {
        handArray.removeAll()
        for str in hands {
            handArray.append(str)
        }
        Logger.info.info("Hands in Array \(handArray)")
        for i in 0..<buttonArray.count {
            buttonArray[i].setTitle(hands[i], for: .normal)
        }
    }
    func updateSubviews(_ hands: [String], score: Int) {
        handArray.removeAll()
        for i in 0..<buttonArray.count {
            buttonArray[i].setTitle(hands[i], for: .normal)
        }
        scorelabel.text = String(score)
        
        
        
    }
    
}

