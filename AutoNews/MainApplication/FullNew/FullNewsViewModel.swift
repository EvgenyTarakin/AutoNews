//
//  FullNewsViewModel.swift
//  AutoNews
//
//  Created by Евгений Таракин on 10.03.2024.
//

import Foundation

// MARK: - FullNewViewToViewModelProtocol

protocol FullNewViewToViewModelProtocol: AnyObject {
    func viewDidLoad()
    func getNewURL() -> URL?
}

final class FullNewViewModel {
    
    // MARK: - property
    
    weak var view: FullNewViewModelToViewProtocol?
    
    // MARK: - private property
    
    private var new: New?
    
    // MARK: - init
    
    init(new: New?) {
        self.new = new
    }
    
}

// MARK: - func

extension FullNewViewModel {
    func getNewURL() -> URL? {
        return new?.fullUrl
    }
}

// MARK: - NewsViewToViewModelProtocol

extension FullNewViewModel: FullNewViewToViewModelProtocol {
    func viewDidLoad() {
        view?.updateDataWith(new: new)
    }
}
