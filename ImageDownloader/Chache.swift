//
//  StoreData.swift
//  ImageDownloader
//
//  Created by Devesh Rawat on 12/10/17.
//  Copyright © 2017 vishal. All rights reserved.
//

import Foundation

class Cache {
 
    var cache:NSCache<AnyObject, AnyObject>!
    
    static let sharedInstance = Cache()
    
    private init() {
       self.cache = NSCache()
    }
    
    func saveData(key:String, data:Data){
        self.cache.setObject(data as AnyObject, forKey: key as AnyObject)
    }
    
    func getData(key:String) -> Data? {
        if ((self.cache.object(forKey: key as AnyObject)) != nil){
            return self.cache.object(forKey: key as AnyObject) as? Data
        }
        return nil
    }
    
    
}
