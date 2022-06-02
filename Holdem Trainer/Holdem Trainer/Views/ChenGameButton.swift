import Foundation
import UIKit
import Logging

class ChenGameButton: UIButton {
    
    
    override init(frame: CGRect) {
        
         super.init(frame: frame)
         setupButton()
     }
     
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setupButton()
     }
    init(buttonLabel: String) {
        super.init(frame: .zero)
        setTitle(buttonLabel, for: .normal)
    }
    
     func setupButton() {
       
         
     
         
         
         setShadow()
         setTitleColor(.black, for: .normal)
         
         backgroundColor      = UIColor(red: 99/255, green: 1, blue: 250/255, alpha: 1)
         titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
         layer.cornerRadius   = 25
         layer.borderWidth    = 3.0
         layer.borderColor    = UIColor.darkGray.cgColor
     }
     
     
     private func setShadow() {
         layer.shadowColor   = UIColor.black.cgColor
         layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
         layer.shadowRadius  = 8
         layer.shadowOpacity = 0.5
         clipsToBounds       = true
         layer.masksToBounds = false
     }
    
    func buttonTapped() {
        shake()
        hapticExtraHeavy()
    }
    
     func shake() {
         let shake           = CABasicAnimation(keyPath: "position")
         shake.duration      = 0.1
         shake.repeatCount   = 2
         shake.autoreverses  = true
         
         let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
         let fromValue       = NSValue(cgPoint: fromPoint)
         
         let toPoint         = CGPoint(x: center.x + 8, y: center.y)
         let toValue         = NSValue(cgPoint: toPoint)
         
         shake.fromValue     = fromValue
         shake.toValue       = toValue
         
         layer.add(shake, forKey: "position")

}
    
    func hapticExtraHeavy() {
        let gen = UIImpactFeedbackGenerator(style: .heavy)
        gen.impactOccurred()
        gen.impactOccurred()
        gen.impactOccurred()
    }
    
   
    func buttonConstraints(Y: Int) {
          translatesAutoresizingMaskIntoConstraints = false
          heightAnchor.constraint(equalToConstant: 50).isActive = true
          widthAnchor.constraint(equalToConstant: 100).isActive = true
          centerXAnchor.constraint(equalTo: centerXAnchor, constant: -65).isActive = true
         bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(Y)).isActive = true
    }
    
}

