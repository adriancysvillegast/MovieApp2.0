//
//  DetailMovieViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 19/7/22.
//

import UIKit
protocol DetailMovieDelegate: AnyObject {
    func 
}
class DetailMovieViewController: UIViewController{
    
    //MARK: - properties
    private lazy var titleMovie : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var titleMovie = {
        didSet{
            
        }
    }
    
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    //MARK: - setupView
    
    func setupView(){
        view.addSubview(titleMovie)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            titleMovie.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleMovie.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
