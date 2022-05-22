//
//  ChenGameView.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/7/22.
//

import UIKit
import SnapKit
class ChenGameView: UIView {
    let stackView = UIStackView()
    var scorelabel = UILabel()
    var handArray = [String]()
    var buttonOne = ChenGameButton()
    var buttonTwo = ChenGameButton()
    var buttonThree = ChenGameButton()
    var buttonArray = [ChenGameButton]()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        self.backgroundColor = UIColor(red: 99/255, green: 149/255, blue: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
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
        for str in hands {
            handArray.append(str)
        }
        for i in 0..<buttonArray.count {
            buttonArray[i].setTitle(hands[i], for: .normal)
        }
    }
    func updateSubviews(_ hands: [String], score: Int) {
        for i in 0..<buttonArray.count {
            buttonArray[i].setTitle(hands[i], for: .normal)
        }
        scorelabel.text = String(score)
        
    }
    
}
//class DiceShelfView: UIView {
//    let stackView = UIStackView()
//    var diceButtons: [DiceButton: UILabel] = [:]
//
//
// let navItem = UINavigationItem(title: "SomeTitle")
// override init(frame: CGRect) {
//     super.init(frame: frame)
//     createSubviews()
//     self.backgroundColor = UIColor(red: 99/255, green: 149/255, blue: 1, alpha: 1)
// }
//
//   func createSubviews() {
//       self.addSubview(stackView)
//    stackView.snp.makeConstraints { make in
//       make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
//       make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
//       }
//
//       stackView.axis = .vertical
//       stackView.distribution = .equalCentering
//
//        let diceArray = [4,6,8,10,12,20,100]
//        diceArray.forEach({ (value) in
//          let horizontalStack = UIStackView()
//          horizontalStack.axis = .horizontal
//          horizontalStack.spacing = 16
//            let d20Button = DiceButton(maxDiceValue: value)
//            d20Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            d20Button.widthAnchor.constraint(equalToConstant: 100).isActive = true
//            d20Button.setupButton()
//            d20Button.addTarget(self, action: #selector(diceButtonTapped), for: .touchUpInside)
//            horizontalStack.addArrangedSubview(d20Button)
//            let label = UILabel()
//            horizontalStack.addArrangedSubview(label)
//            label.text = "0"
//            stackView.addArrangedSubview(horizontalStack)
//            diceButtons[d20Button] = label
//        })
//    }
//
//    @objc func diceButtonTapped(sender: DiceButton) {
//        guard let label = diceButtons[sender] else {
//            print("label for dice button\(sender.maxDiceValue) does not exist")
//            return
//        }
//        label.text = String(Int.random(in: 1 ... sender.maxDiceValue))
//        sender.hapticExtraHeavy()
//        sender.shake()
//    }
//}
