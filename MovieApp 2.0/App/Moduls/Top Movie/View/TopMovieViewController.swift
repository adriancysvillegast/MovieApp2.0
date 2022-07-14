//
//  TopMovieViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 10/7/22.
//

import UIKit


class TopMovieViewController: UIViewController{
    
    //MARK: - Properties

    private lazy var viewModel: TopMovieViewModel? = {
        let viewModel = TopMovieViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private var spinnerLoad: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.isHidden = true
        return spinner
    }()
    
    lazy var atableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Movies"
        setupView()
        setupConstrainst()
        
        viewModel?.getTopMovie()
    }
    
    //MARK: - SetupView
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(atableView)
    }
    
    func setupConstrainst(){
        NSLayoutConstraint.activate([
 
            atableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            atableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            atableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            atableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource, TopMovieViewModelDelegate
extension TopMovieViewController: UITableViewDelegate, UITableViewDataSource, TopMovieViewModelDelegate {
    
    func reloadData() {
        atableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.topMovies.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell") as! UITableViewCell
        if let movie = viewModel?.showTopMovie(index: indexPath.row){
            cell.textLabel?.text = movie.originalTitle
        }
        return cell
    }
    
    
    
}
