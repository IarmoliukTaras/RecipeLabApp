//
//  Extensions.swift
//  RecipeLab
//
//  Created by 123 on 22.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadUsingCacheWith(url: String) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            self.image = cachedImage
            return
        }
        PupppyService.sharedInstance.downloadImage(urlStr: url) { (data) in
            DispatchQueue.main.async {
                guard let downloadedImage = UIImage(data: data) else { return }
                imageCache.setObject(downloadedImage, forKey: url as NSString)
                self.image = downloadedImage
            }
        }
    }
}
