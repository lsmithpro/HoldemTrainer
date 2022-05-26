import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .gray
        window?.rootViewController = HoldemTabBarController()
        let scores: [GameScore] = DataManager.shared.getAll()
        scores.forEach { score in
            print("   \(score.name):  Correct\(score.correct): attempts\(score.attempts)")
            
        }
        
        return true
        
    }
    
}
