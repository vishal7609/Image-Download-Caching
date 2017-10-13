//
//  Image.swift
//  ImageDownloader
//
//  Created by Devesh Rawat on 12/10/17.
//  Copyright © 2017 vishal. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    func setImageFromUrl(imageUrl:String) {
        let urlRegex = "(?i)https?://(?:www\\.)?\\S+(?:/|\\b)"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegex)
        if urlTest.evaluate(with: imageUrl) {
            guard let urlOfImage = URL(string: imageUrl) else {
                return
            }
            let imageData = Cache.sharedInstance.getData(key: imageUrl)
            if imageData != nil {
                DispatchQueue.main.async() {
                    self.image = UIImage(data: imageData!)
                }
            }else {
                Service.downloadImage(urlOfImage, success: { (imageData) in
                    print(imageData)
                    Cache.sharedInstance.saveData(key: imageUrl, data: imageData)
                    // Finally convert that Data into an image and do what you wish with it.
                    DispatchQueue.main.async() {
                        self.image = UIImage(data: imageData)
                    }
                }, failure: { (error) in
                    print(error!.domain)
                })
            }
           
        }
    }
    
    
    func setImageFromUrl(imageUrl:String, placeholderImage: UIImage) {
        self.image = placeholderImage
        let urlRegex = "(?i)https?://(?:www\\.)?\\S+(?:/|\\b)"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegex)
        if urlTest.evaluate(with: imageUrl) {
            guard let urlOfImage = URL(string: imageUrl) else {
                return
            }
            let imageData = Cache.sharedInstance.getData(key: imageUrl)
            if imageData != nil {
                DispatchQueue.main.async() {
                    self.image = UIImage(data: imageData!)
                }
            }else {
                Service.downloadImage(urlOfImage, success: { (imageData) in
                    print(imageData)
                    Cache.sharedInstance.saveData(key: imageUrl, data: imageData)
                    // Finally convert that Data into an image and do what you wish with it.
                    DispatchQueue.main.async() {
                        self.image = UIImage(data: imageData)
                    }
                }, failure: { (error) in
                    print(error!.domain)
                })
            }
        }
    }
    
    func setImageFromUrl(imageUrl:String, placeholderImage: UIImage, success: @escaping (_ imageData: Data) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        self.image = placeholderImage
        let urlRegex = "(?i)https?://(?:www\\.)?\\S+(?:/|\\b)"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegex)
        if urlTest.evaluate(with: imageUrl) {
            guard let urlOfImage = URL(string: imageUrl) else {
                return
            }
            let imageData = Cache.sharedInstance.getData(key: imageUrl)
            if imageData != nil {
                success(imageData!)
            }else {
                Service.downloadImage(urlOfImage, success: { (imageData) in
                    print(imageData)
                    Cache.sharedInstance.saveData(key: imageUrl, data: imageData)
                    success(imageData)
                }, failure: { (error) in
                    failure(error)
                })
            }
        }
    }
    
    
}
