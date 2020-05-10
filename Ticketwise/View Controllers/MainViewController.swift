//
//  MainViewController.swift
//  Ticketwise
//
//  Created by Nay Min Ko on 10/05/2020.
//  Copyright © 2020 Lolita Moratova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let menuTransioningDelegate = MenuTransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showMenu() {
        let menuVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MenuViewController")
        menuVc.modalPresentationStyle = .custom
        menuVc.transitioningDelegate = menuTransioningDelegate
        present(menuVc, animated: true)
    }
}

class MenuTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuAnimationController(present: false)
    }
}
