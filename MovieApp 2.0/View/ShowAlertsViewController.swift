//
//  ShowAlertsViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 27/4/22.
//

import UIKit

class ShowAlertsViewController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func showAlert(message: String)-> UIAlertController{
        let alert = UIAlertController(title: "Ups!, We Get an Error", message: "Description: \(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        return alert
    }

}
