//
//  UIImageView+Extension.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 13/7/22.
//

import UIKit

extension UIImageView {
    
    func load(url: URL){
        DispatchQueue.global().async { [weak self]  in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
