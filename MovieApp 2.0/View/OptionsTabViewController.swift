//
//  TabViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit

class OptionsTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    

    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
}
