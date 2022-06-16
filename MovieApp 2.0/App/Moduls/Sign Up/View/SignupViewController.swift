//
//  SignupViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 4/6/22.
//

import UIKit

class SignupViewController: UIViewController{
    
//MARK: - Properties
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private var labelTitle : UILabel = {
       let label = UILabel()
        label.text = "Movie App"
        label.font = UIFont(name: "Noteworthy Light", size: 40)
        label.textAlignment = .center
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        setUpGradientLayer()
        setUpView()
        setupContrains()
        
    }
    
    private func setUpView(){
        view.addSubview(scrollView)
        view.addSubview(labelTitle)
    }
    
    private func setupContrains(){
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            labelTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50)
            
        ])
    }
    
    private func setUpGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemTeal.cgColor,
                           UIColor.systemGray2.cgColor]
        scrollView.layer.addSublayer(gradient)
        
    }
}
