//
//  PhotoViewController.swift
//  Gallery
//
//  Created by George Kyrylenko on 19.04.2020.
//  Copyright © 2020 George Kyrylenko. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var photoModel: PhotoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        setPhoto()
        // Do any additional setup after loading the view.
    }
    
    func setPhoto(){
        let url = URL(string: photoModel?.urls?.full ?? "")
        self.title = photoModel?.user?.username
        imgPhoto.kf.setImage(with: url)
    }
    @IBAction func shareAction(_ sender: Any) {
        guard let image = imgPhoto.image else {return}

        // set up activity view controller
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func openInstagrammAction(_ sender: Any) {
        let instagramHooks = "instagram://user?username=\(photoModel?.user?.instagram_username ?? "")"
        let instagramUrl = URL(string: instagramHooks)
//        if UIApplication.shared.canOpenURL(instagramUrl!) {
            UIApplication.shared.open(instagramUrl!)
//        } else {
//          //redirect to safari because the user doesn't have Instagram
//            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
//        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgPhoto
    }
}
