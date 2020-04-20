//
//  ViewController.swift
//  Gallery
//
//  Created by George Kyrylenko on 05.04.2020.
//  Copyright © 2020 George Kyrylenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PhotosCollectionLayoutDelegate {
    
    private lazy var layout = PhotosCollectionViewLayout(with: self)
    var page = 1
    @IBOutlet weak var photosCollectionView: UICollectionView!
    var photos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.collectionViewLayout = layout
        paginateImages()
    }
    
    func paginateImages(){
        NetworkManager.shared.getPhotos(page: page) {[weak self] (response) in
            switch response{
            case .success(let photosResponse):
                let firstIndex = self?.photos.count ?? 0
                let lastIndex = firstIndex + photosResponse.count - 1
                var indexPathes = [IndexPath]()
                for i in firstIndex...lastIndex{
                    indexPathes.append(IndexPath(row: i, section: 0))
                }
                self?.photos.append(contentsOf: photosResponse)
                DispatchQueue.main.async {
                    self?.page += 1
                    self?.photosCollectionView.insertItems(at: indexPathes)
                }
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func collectionLayout(_ layout: PhotosCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(photos[indexPath.row].width ?? 1) ,height: CGFloat(photos[indexPath.row].height ?? 1))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == photos.count - 5 {
            paginateImages()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.setData(photo: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as? PhotoViewController else {return}
        vc.photoModel = photos[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
