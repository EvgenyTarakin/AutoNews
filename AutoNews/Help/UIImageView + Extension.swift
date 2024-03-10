//
//  UIImageView = Extension.swift
//  AutoNews
//
//  Created by Евгений Таракин on 10.03.2024.
//

import UIKit

extension UIImageView {
    func imageFromServerURL(_ url: URL?) {
        guard let url else {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                image = UIImage(systemName: "photo")
            }
            return
        }
        DispatchQueue.main.async { [weak self] in
            guard let self
            else {
                self?.imageFromServerURL(url)
                return
            }
            
            if let cashedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                image = cashedImage
            } else {
                imageFromServerURL(url)
            }
        }
    }
}
