//
//  RegisterViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var continueButtonOutlet: UIButton!
    //MARK: - Vars
    
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCorner()
        
    }
    
//MARK: - buttonCorner
    func buttonCorner() {
        continueButtonOutlet.layer.cornerRadius = 10
    }
    
    
    //MARK: - RegisterButtonPressed
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
//        registerMethod firebase
        
    }
    
    


}
