//
//  Service.swift
//  ImageDownloader
//
//  Created by Devesh Rawat on 12/10/17.
//  Copyright © 2017 vishal. All rights reserved.
//

import Foundation


class Service {
    
    class func downloadImage(_ imageUrl:URL,success: @escaping (_ data: Data) -> Void, failure: @escaping (_ error: NSError?) -> Void){
        
        // Creating a session object with the default configuration.
        // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
        let session = URLSession(configuration: .default)
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: imageUrl) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        success(imageData)
                        // Do something with your image.
                    } else {
                        let error = NSError(domain: "Couldn't get image: Image is nil", code: 201, userInfo: nil)
                        failure(error)
                    }
                } else {
                    let error = NSError(domain: "Couldn't get response code for some reason", code: 202, userInfo: nil)
                    failure(error)
                }
            }
        }
        downloadPicTask.resume()
        
    }
    
}
