//
//  HoldemTabBarController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 4/26/22.
//

import UIKit

class HoldemTabBarController: UITabBarController {

    override func viewDidLoad() {
       
    
            super.viewDidLoad()
        let nav = genNavCon(vc: ChenGameViewController(), title: "ChenGame", image: UIImage(systemName: "multiply.circle.fill")! )
       let nav2 = genNavCon(vc: PotOddsViewController(), title: "PotOdds", image: UIImage(systemName: "square.and.arrow.up.fill")!)
        self.tabBar.backgroundColor = .white
            viewControllers  = [nav,nav2]

        // Do any additional setup after loading the view.
    }
    
 
        fileprivate func genNavCon(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
            let navCon = UINavigationController(rootViewController: vc)
            vc.navigationItem.title = title
            navCon.title = title
            navCon.tabBarItem.image = image
            return navCon
        }
        
    }


