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
    
    private var url: URL?
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .black.withAlphaComponent(0.1)
        backView.layer.cornerRadius = 13
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    private lazy var backImageView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .clear
        backView.layer.cornerRadius = 13
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.clipsToBounds = true
        
        return backView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicator
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
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
    
    // MARK: - override func
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        imageView.image = nil
    }
    
}

// MARK: - func

extension NewsCell {
    func configurate(title: String) {
        titleLabel.text = title
    }
    
    func setImage(_ urlImage: URL?) {
        imageView.imageFromServerURL(urlImage)
    }
    
    func animateSelectCell() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self else { return }
            backView.bounds.size.width += 12
            backView.bounds.size.height += 12
        })
    }
}

// MARK: - private func

private extension NewsCell {
    func commonInit() {
        addSubview(backView)
        addSubview(backImageView)
        backImageView.addSubview(imageView)
        addSubview(activityIndicator)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backView.leftAnchor.constraint(equalTo: leftAnchor),
            backView.rightAnchor.constraint(equalTo: rightAnchor),
            
            backImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            backImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            backImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            backImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.70),
            
            imageView.topAnchor.constraint(equalTo: backImageView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: backImageView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: backImageView.rightAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
