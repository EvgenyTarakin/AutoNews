//
//  NetworkManager.swift
//  AutoNews
//
//  Created by Евгений Таракин on 02.03.2024.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

final class NetworkManager {
    
    // MARK: - private property
    
    private(set) var countNews = 0
    
    private var newsModel: NewsModel?
    
    private var news: [New] = [] {
        didSet {
            countNews = news.count
        }
    }
    
    private var imageURLs: [URL] = []
    private var loadingImageURLs: [URL] = []
    
    // MARK: - init
    
    init() {
        
    }
    
    // MARK: - func
    
    func getAutoNews(page: Int) async throws {
        guard let request = createRequest(for: "https://webapi.autodoc.ru/api/news/\(page)/15")
        else { return }
        let (data, _) = try await URLSession.shared.data(for: request)
        let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
        news += newsModel.news ?? []
        
        for new in newsModel.news ?? [] {
            if let imageURL = new.titleImageUrl {
                imageURLs.append(imageURL)
            }
        }
        
        try await loadImages()
    }
    
    func getNew(index: Int) -> New {
        return news[index]
    }
    
    
    func clearAllData() {
        countNews = 0
        news = []
    }
    
    // MARK: - private func
    
    private func createRequest(for url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    private func loadImages() async throws {
        for url in imageURLs {
            if !loadingImageURLs.contains(url) {
                URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
                    guard let self else { return }
                    
                    if error != nil {
                        return
                    }
                    
                    if let data = data, let downloadedImage = UIImage(data: data)?.aspectFittedToHeight(200) {
                        loadingImageURLs.append(url)
                        imageCache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
                    }
                }).resume()
            }
        }
    }
    
    private func loadImage() {
        
    }
    
}
