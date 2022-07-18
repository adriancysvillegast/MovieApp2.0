//
//  TopMovieCell.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 14/7/22.
//

import UIKit

class TopMovieCell: UICollectionViewCell {
    
    //MARK: - Properties
    let identifier = "TopMovieCell"
    
    private var imageViewMovie: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Inicializer and setupViews
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [imageViewMovie].forEach {
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageViewMovie.topAnchor.constraint(equalTo: topAnchor),
            imageViewMovie.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewMovie.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageViewMovie.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configureCell
    
    func configureCell(model: MovieData ){
        if let image = UIImage(data: model.dataImage){
            self.imageViewMovie.image = image
        }
    }
}
