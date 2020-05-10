import UIKit

extension UIViewController {
    
    @IBAction func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRoot() {
        tabBarController?.tabBar.isHidden = false
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func hideTabBar() {
        tabBarController?.tabBar.isHidden = true
    }
}
