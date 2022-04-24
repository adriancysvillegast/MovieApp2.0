//
//  WelcomeViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var getStartOutlet: UIButton!
    @IBOutlet weak var titleText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getStartOutlet.layer.cornerRadius = 10
        titleTextShow()
    }

//MARK: - titleTextShow
    func titleTextShow(){
        titleText.text = ""
        var index = 0.0
        let title = Constants.Title.titleName
        
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { Timer in
                self.titleText.text?.append(letter)
            }
            index += 1
        }
    }
    
    
    //MARK: - Get Start Button
    
    @IBAction func getStartButtonPressed(_ sender: UIButton) {
//        nextView
        performSegue(withIdentifier: Constants.Segues.goToLogin, sender: self)
    }
    
}

