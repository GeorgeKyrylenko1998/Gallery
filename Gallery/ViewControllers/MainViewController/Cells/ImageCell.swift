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
    
    func setData(photo: PhotoModel){
        let url = URL(string: photo.urls?.full ?? "")
        photoImageView.kf.setImage(with: url)
        username.text = photo.user?.username
        likes.text = "\(photo.likes ?? 0)"
    }
    
    func makeGradient(){
       var gradientLayer = CAGradientLayer()
        
           gradientLayer.frame = gradientView.bounds
        
           gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 1), UIColor(red: 0, green: 0, blue: 0, alpha: 0)]
        
           gradientView.layer.addSublayer(gradientLayer)
    }
}
