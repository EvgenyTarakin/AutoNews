//
//  UIViewController + Extension.swift
//  AutoNews
//
//  Created by Евгений Таракин on 26.02.2024.
//

import UIKit

extension UIViewController {
    var iPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
