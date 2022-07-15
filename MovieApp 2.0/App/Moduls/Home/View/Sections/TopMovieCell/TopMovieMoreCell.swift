//
//  TopMovieMoreCell.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 14/7/22.
//

import UIKit

class TopMovieMoreCell: UICollectionViewCell {
    
    //MARK: - Properties
    let identifier = "TopMovieMoreCell"
    
    private var moreMoviesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SeeMoreIcon"), for: .selected)
        return button
    }()
    
    //MARK: - Inicializer and setupViews
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [moreMoviesButton].forEach {
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            moreMoviesButton.topAnchor.constraint(equalTo: topAnchor),
            moreMoviesButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            moreMoviesButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreMoviesButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
