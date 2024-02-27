//
//  NewsCell.swift
//  AutoNews
//
//  Created by Евгений Таракин on 26.02.2024.
//

import UIKit

final class NewsCell: UICollectionViewCell {
    
    // MARK: - property
    
    static let reuseIdentifier = String(describing: NewsCell.self)
    
    // MARK: - private property
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .black.withAlphaComponent(0.1)
        backView.layer.cornerRadius = 13
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: - func

extension NewsCell {
    func configurate(title: String, imageUrl: URL) {
        titleLabel.text = title
    }
    
    func animateSelectCell() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self else { return }
            backView.bounds.size.width -= 24
            backView.bounds.size.height -= 24
        })
    }
}

// MARK: - private func

private extension NewsCell {
    func commonInit() {
        layer.cornerRadius = 16
        
        addSubview(backView)
        addSubview(imageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backView.leftAnchor.constraint(equalTo: leftAnchor),
            backView.rightAnchor.constraint(equalTo: rightAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16)
        ])
    }
}
