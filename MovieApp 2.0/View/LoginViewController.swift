//
//  LoginViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButtonOutlet.layer.cornerRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
