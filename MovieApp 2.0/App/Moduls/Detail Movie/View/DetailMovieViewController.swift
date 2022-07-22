//
//  DetailMovieViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 19/7/22.
//

import UIKit

class DetailMovieViewController: UIViewController{
    
    //MARK: - properties
    
    lazy var contentViewSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
    
    private lazy var viewModel: DetailMovieViewModel? = {
        let viewModel = DetailMovieViewModel()
        viewModel.delegate = self
        viewModel.delegateSpinner = self
        return viewModel
    }()
    
    var idMovie: Int?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = view.bounces
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.showsHorizontalScrollIndicator = true
        view.contentSize = contentViewSize
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.style = .medium
        spinner.isHidden = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var titleMovie : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 5
        label.textAlignment = .center
        label.baselineAdjustment = .alignBaselines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .justified
        label.numberOfLines = 80
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var adultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Adult:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var adultValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Genre:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lenguageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Lenguage:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lenguageValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var popularityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Popularity:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var popularityValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Release Date:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        viewModel?.getDetailMovie(movie: idMovie)
    }
    
    //MARK: - setupView
    
    func setupView(){
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        [imageView, titleMovie, descriptionLabel, adultLabel, adultValue, genreLabel, genreValue, lenguageLabel, lenguageValue, popularityLabel, popularityValue, releaseLabel, releaseValue, spinner].forEach {
            containerView.addSubview($0)
        }
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 310),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            
            titleMovie.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleMovie.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleMovie.widthAnchor.constraint(equalToConstant: 230),
            titleMovie.heightAnchor.constraint(equalToConstant: 60),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            adultLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            adultLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            adultValue.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            adultValue.leadingAnchor.constraint(equalTo: adultLabel.trailingAnchor, constant: 2),
            
            genreLabel.topAnchor.constraint(equalTo: adultLabel.bottomAnchor, constant: 10),
            genreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            genreValue.topAnchor.constraint(equalTo: adultValue.bottomAnchor, constant: 10),
            genreValue.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 2),
            
            lenguageLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10),
            lenguageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            lenguageValue.topAnchor.constraint(equalTo: genreValue.bottomAnchor, constant: 10),
            lenguageValue.leadingAnchor.constraint(equalTo: lenguageLabel.trailingAnchor, constant: 2),
            
            popularityLabel.topAnchor.constraint(equalTo: lenguageLabel.bottomAnchor, constant: 10),
            popularityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            popularityValue.topAnchor.constraint(equalTo: lenguageValue.bottomAnchor, constant: 10),
            popularityValue.leadingAnchor.constraint(equalTo: popularityLabel.trailingAnchor, constant: 2),
            
            releaseLabel.topAnchor.constraint(equalTo: popularityLabel.bottomAnchor, constant: 10),
            releaseLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            releaseValue.topAnchor.constraint(equalTo: popularityValue.bottomAnchor, constant: 10),
            releaseValue.leadingAnchor.constraint(equalTo: releaseLabel.trailingAnchor, constant: 2),
            
            spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    
}

extension DetailMovieViewController: DetailMovieViewModelDelegate, SpinnerLoadDelegate {
    
    func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
        
    }
    
    func hideProperties() {
        [imageView, titleMovie, descriptionLabel, adultLabel, adultValue, genreLabel, genreValue, lenguageLabel,lenguageValue, popularityLabel, popularityValue, releaseLabel, releaseValue].forEach {
            $0.isHidden = true
        }
    }
    
    func showProperties() {
        [imageView, titleMovie, descriptionLabel, adultLabel, adultValue, genreLabel, genreValue, lenguageLabel,lenguageValue, popularityLabel, popularityValue, releaseLabel, releaseValue].forEach {
            $0.isHidden = false
        }
    }
    
    func updateView(movie: MovieDetails) {
        self.titleMovie.text = movie.originalTitle
        self.descriptionLabel.text = movie.overview
        self.adultValue.text = String(movie.adult)
        self.lenguageValue.text = movie.originalLanguage
        self.popularityValue.text = String(movie.popularity)
        self.releaseValue.text = movie.releaseDate
    }
    
    func updateImage(data: Data) {
        self.imageView.image = UIImage(data: data)
    }
    
    func updateGenre(genre: [String]) {
        self.genreValue.text = genre.joined(separator: ",")
    }
    func showError(message: String) {
        let alert = UIAlertController(title: Constants.ErrorMessages.title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    
}
