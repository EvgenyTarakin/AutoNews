//
//  String + Extension.swift
//  AutoNews
//
//  Created by Евгений Таракин on 11.03.2024.
//

import Foundation

extension String {
    func dateFromJSON() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        if dateFormatterGet.date(from: self) == nil {
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        }
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        dateFormatterPrint.dateStyle = DateFormatter.Style.short
        dateFormatterPrint.locale = NSLocale(localeIdentifier: "ru") as Locale
        
        guard let date = dateFormatterGet.date(from: self) else { return "" }
        
        return dateFormatterPrint.string(from: date)
    }
}
