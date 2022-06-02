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
        
        statisticsArray.forEach() { score in
            let statsStack = UIStackView()
            statsStack.axis = .horizontal
            statsStack.distribution = .equalSpacing
            let nameLabel = UILabel()
            nameLabel.text = "\(score.name)"
            statsStack.addArrangedSubview(nameLabel)
            let correctLabel = UILabel()
            correctLabel.text = "\(score.correct)"
            statsStack.addArrangedSubview(correctLabel)
            let attemptsLabel = UILabel()
            attemptsLabel.text = "\(score.attempts)"
            statsStack.addArrangedSubview(attemptsLabel)
            let percentageLabel = UILabel()
            percentageLabel.text = "\(Double(score.correct) / Double(score.attempts != 0 ? score.attempts : 1))%"
            statsStack.addArrangedSubview(percentageLabel)
            
            stackView.distribution = .fillEqually
            stackView.addArrangedSubview(statsStack)
        
        }
        
    
        
        
    }
   
    func updateSubviews() {
        
    }
    
}
