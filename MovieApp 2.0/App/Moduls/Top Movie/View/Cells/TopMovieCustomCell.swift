//
//  TopMovieCustomCell.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 13/7/22.
//

import UIKit

class TopMovieCustomCell: UITableViewCell {

    //MARK: - Properties
    let identifier = "TopMovieCustomCell"
    
    private let imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - SetupView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imageViewCell)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageViewCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageViewCell.widthAnchor.constraint(equalToConstant: 80),
            imageViewCell.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
  
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - configureCell
    /**Set the value to the view**/
    func configureCell(model: Movie){
        guard let urlString = URL(string: "\(Constants.API.Urls.getImage)\(model.posterPath)") else { return }
        self.imageViewCell.load(url: urlString)
        self.titleLabel.text = model.originalTitle
    }
}
