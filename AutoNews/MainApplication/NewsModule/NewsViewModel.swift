//
//  NewsViewModel.swift
//  AutoNews
//
//  Created by Евгений Таракин on 26.02.2024.
//

import Foundation
import UIKit

// MARK: - NewsViewToViewModelProtocol

protocol NewsViewToViewModelProtocol: AnyObject {
    func viewDidLoad()
    func loadNextPageNews()
    func getCountNews() -> Int
    func getNew(index: Int) -> New?
}

final class NewsViewModel {
    
    // MARK: - property
    
    weak var view: NewsViewModelToViewProtocol?
    
    // MARK: - private property
    
    private var networkManager = NetworkManager()
    
    private var page = 1
            
}

// MARK: - private func

private extension NewsViewModel {
    func loadImageNews() {
        
    }
}

// MARK: - NewsViewToViewModelProtocol

extension NewsViewModel: NewsViewToViewModelProtocol {
    func viewDidLoad() {
        Task {
            do {
                networkManager.clearAllData()
                page = 1
                try await networkManager.getAutoNews(page: page)
                view?.updateNewsWithData()
            } catch {
                
            }
        }
    }
    
    func loadNextPageNews() {
        Task {
            do {
                page += 1
                try await networkManager.getAutoNews(page: page)
                view?.updateNewsWithData()
            } catch {
                
            }
        }
    }
    
    func getCountNews() -> Int {
        return networkManager.countNews
    }
    
    func getNew(index: Int) -> New? {
        return networkManager.getNew(index: index)
    }
}
