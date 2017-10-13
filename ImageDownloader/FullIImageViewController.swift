//
//  FullIImageViewController.swift
//  ImageDownloader
//
//  Created by Devesh Rawat on 12/10/17.
//  Copyright © 2017 vishal. All rights reserved.
//

import UIKit

class FullIImageViewController: UIViewController {

    @IBOutlet weak var fullImageView: UIImageView!
    
    var imageUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = imageUrl {
           fullImageView.setImageFromUrl(imageUrl: url)
        }
        
    }

    

}
