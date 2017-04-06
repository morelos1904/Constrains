//
//  UIImageView+Network.swift
//  Rss
//
//  Created by MCS on 3/30/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImageFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFill) {
       contentMode = mode
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                
                else { return }
                DispatchQueue.main.async() { () -> Void in
                    self.image = image
                }
            }.resume()
    }
    
    func downloadImageFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloadImageFrom(url: url, contentMode: mode)
    }
    
}
