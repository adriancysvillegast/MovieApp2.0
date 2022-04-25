//
//  DetailMovieViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 25/4/22.
//

import UIKit

class DetailMovieViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        register()
    }
    
    func register(){
        let viewDetail = DetailXIBViewController(nibName: Constants.Xibs.viewDetail, bundle: nil)
        present(viewDetail, animated: true, completion: nil)
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
