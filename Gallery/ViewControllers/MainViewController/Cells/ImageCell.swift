//
//  ImageCell.swift
//  Gallery
//
//  Created by George Kyrylenko on 13.04.2020.
//  Copyright © 2020 George Kyrylenko. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var likes: UILabel!
    let gradientLayer = CAGradientLayer()
    
    func setData(photo: PhotoModel){
        let url = URL(string: photo.urls?.small ?? "")
        photoImageView.kf.setImage(with: url)
        username.text = photo.user?.username
        likes.text = "\(photo.likes ?? 0)"
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layoutIfNeeded()
                makeGradient()
    }
    
    func makeGradient(){
        gradientLayer.removeFromSuperlayer()
        gradientLayer.frame = gradientView.bounds
        
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor]
        
        gradientView.layer.addSublayer(gradientLayer)
    }
}
