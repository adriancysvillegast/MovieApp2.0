//
//  HomeViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 14/7/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    /**Properties Home**/
    private lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        viewModel.delegate = self
        viewModel.delegateSpinner = self
        return viewModel
    }()
    
    private lazy var spinnerLoad: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.isHidden = true
        spinner.style = .medium
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    /**Top movies Properties **/
    private lazy var titleTopMovie: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Top Rated 20 Movies"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionViewTopMovie: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(TopMovieCell.self, forCellWithReuseIdentifier: TopMovieCell().identifier)
        collectionView.register(TopMovieMoreCell.self, forCellWithReuseIdentifier: TopMovieMoreCell().identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    /**Trending Properties **/
    private lazy var titleTrending: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Trending"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionViewTrending: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var aTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupView()
        setupConstraints()
        
        viewModel.getTopMovies()
    }
    
    
    //MARK: - SetupViews
    
    private func setupView() {
        view.backgroundColor = .white
        
        [spinnerLoad, titleTopMovie, collectionViewTopMovie].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleTopMovie.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleTopMovie.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            collectionViewTopMovie.topAnchor.constraint(equalTo: titleTopMovie.bottomAnchor),
            collectionViewTopMovie.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionViewTopMovie.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionViewTopMovie.heightAnchor.constraint(equalToConstant: 250),
            
            spinnerLoad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerLoad.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
//MARK: - DELEGATE: UICollectionViewFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    //UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getTopMovieCount()
    }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 19 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMovieMoreCell().identifier, for: indexPath) as? TopMovieMoreCell else {
                return UICollectionViewCell() }
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMovieCell().identifier, for:indexPath) as? TopMovieCell else {
                return UICollectionViewCell()
                }
            cell.configureCell(model: viewModel.getTopMovie(index: indexPath.row))
            return cell
        }
    }
//    UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: 250)
    }
//    UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewTopMovie{
//            let vc = DetailMovieController()
//            vc.idMovie = viewModel.lookMovie(index: indexPath.row)
        }
    }
}

//MARK: - HomeViewModelDelegate, SpinnerLoadDelegate
extension HomeViewController: HomeViewModelDelegate, SpinnerLoadDelegate {
//    SpinnerLoadDelegate
    func showSpinner() {
        spinnerLoad.isHidden = false
        spinnerLoad.startAnimating()
    }
    
    func hideSpinner() {
        spinnerLoad.isHidden = false
        spinnerLoad.stopAnimating()
    }
//    HomeViewModelDelegate
    func hideView() {
        [titleTopMovie, collectionViewTopMovie].forEach {
            $0.isHidden = true
        }
    }
    
    func showView() {
        [titleTopMovie, collectionViewTopMovie].forEach {
            $0.isHidden = false
        }
    }
    
    func reload() {
        collectionViewTopMovie.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: Constants.ErrorMessages.title, message: Constants.ErrorMessages.didError, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}
