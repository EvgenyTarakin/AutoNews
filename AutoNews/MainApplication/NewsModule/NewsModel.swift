//
//  NewsModel.swift
//  AutoNews
//
//  Created by Евгений Таракин on 26.02.2024.
//

import Foundation

// MARK: - NewsViewModelToModelProtocol

protocol NewsViewModelToModelProtocol {
    func getNews()
}

final class NewsModel {
    
    // MARK: - property
    
    weak var viewModel: NewsModelToViewModelProtocol?
    
}

// MARK: - NewsViewModelToModelProtocol

extension NewsModel: NewsViewModelToModelProtocol {
    func getNews() {
        viewModel?.didFinishLoadNews()
    }
}
