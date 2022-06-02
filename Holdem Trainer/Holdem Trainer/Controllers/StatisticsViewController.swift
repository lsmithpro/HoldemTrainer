//
//  StatisticsViewController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 5/26/22.
//

import UIKit
import SnapKit

class StatisticsViewController: UIViewController {
    let statisticsView = StatisticsView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = statisticsView
    }
    
    
    
}
