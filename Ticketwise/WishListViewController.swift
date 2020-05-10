//
//  WishListViewController.swift
//  Ticketwise
//
//  Created by Ahmad Ullah on 07/05/2020.
//  Copyright © 2020 Lolita Moratova. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    // Hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // Make the navigation bar appear after this view controller
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
}

