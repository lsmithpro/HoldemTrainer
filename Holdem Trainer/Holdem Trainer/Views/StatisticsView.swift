//
//  StatisticsView.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 5/26/22.
//

import UIKit
import Logging
import SnapKit

class StatisticsView: UIView {
    
    let stackView = UIStackView()
    let statisticsArray: [GameScore]
    let statsText = UITextView()
    
    
    

    
    
    
    override init(frame: CGRect) {
        Logger.viewCycle.info("Statistics View initialized")
        statisticsArray = DataManager.shared.getAll()
        super.init(frame: frame)
        createSubviews()
        self.backgroundColor = UIColor(red: 99/255, green: 149/255, blue: 1, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        Logger.viewCycle.info("Statistics View initialized")
        statisticsArray = DataManager.shared.getAll()
        super.init(coder: aDecoder)
        createSubviews()
    }
   
    
    func createSubviews() {
        self.addSubview(stackView)
        stackView.axis = .vertical
        
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
        }
        statsText.text = "Rules for the Game are as Follows: 3 Poker hands are presented, Choose the hand with the highest value according to Chen's Formula, all answers tied for the highest value will be considered correct"
        statsText.backgroundColor = UIColor(red: 99/255, green: 149/255, blue: 1, alpha: 1)
        statsText.font = UIFont(name: "Helvetica", size: 20)
        statsText.isEditable = false    
        stackView.addArrangedSubview(statsText)
        
    
        
        
    }
   
    func updateSubviews() {
        
    }
    
}
