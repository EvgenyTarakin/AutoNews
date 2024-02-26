//
//  NewsViewModel.swift
//  AutoNews
//
//  Created by Евгений Таракин on 26.02.2024.
//

import Foundation

// MARK: - NewsViewToViewModelProtocol

protocol NewsViewToViewModelProtocol: AnyObject {
    func viewDidLoad()
}

// MARK: - protocol

protocol NewsModelToViewModelProtocol: AnyObject {
    func didFinishLoadNews()
}

final class NewsViewModel {
    
    // MARK: - property
    
    weak var view: NewsViewModelToViewProtocol?
    
    var model: NewsViewModelToModelProtocol?
    
}

// MARK: - NewsViewToViewModelProtocol

extension NewsViewModel: NewsViewToViewModelProtocol {
    func viewDidLoad() {
        model?.getNews()
    }
}

// MARK: - NewsModelToViewModelProtocol
extension NewsViewModel: NewsModelToViewModelProtocol {
    func didFinishLoadNews() {
        view?.updateNewsWithData()
    }
}
