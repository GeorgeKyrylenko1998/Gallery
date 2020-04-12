//
//  ViewController.swift
//  Gallery
//
//  Created by George Kyrylenko on 05.04.2020.
//  Copyright © 2020 George Kyrylenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var photos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NetworkManager.shared.ge
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

