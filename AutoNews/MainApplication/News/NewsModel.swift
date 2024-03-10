//
//  NewsModel.swift
//  AutoNews
//
//  Created by Евгений Таракин on 02.03.2024.
//

import UIKit

final class NewsModel: Codable {
    let news: [New]?
    let totalCount: Int?
}

final class New: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let publishedDate: String?
    let url: String?
    let fullUrl: URL?
    let titleImageUrl: URL?
    let categoryType: String?
}
