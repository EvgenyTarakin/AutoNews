//
//  FullNewView.swift
//  AutoNews
//
//  Created by Евгений Таракин on 10.03.2024.
//

import UIKit

// MARK: - FullNewViewModelToViewProtocol

protocol FullNewViewModelToViewProtocol: AnyObject {
    func updateDataWith(new: New?)
}

final class FullNewView: UIViewController {
    
    // MARK: - property
    
    var viewModel: FullNewViewToViewModelProtocol?
    
    // MARK: - private property
    
    private lazy var closeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark.circle.fill")
        imageView.tintColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(), for: .normal)
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var backImageView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .clear
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.textColor = .systemBlue
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        viewModel?.viewDidLoad()
    }

}

// MARK: - private func

private extension FullNewView {
    func commonInit() {
        view.backgroundColor = .white

        view.addSubview(backImageView)
        view.addSubview(imageView)
        view.addSubview(closeImageView)
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dateLabel)
        view.addSubview(sourceLabel)
        view.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.67),
            
            imageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: backImageView.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: backImageView.rightAnchor, constant: 0),
            
            closeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            closeImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            closeImageView.heightAnchor.constraint(equalToConstant: 32),
            closeImageView.widthAnchor.constraint(equalToConstant: 32),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            closeButton.heightAnchor.constraint(equalToConstant: 42),
            closeButton.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            dateLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            dateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            sourceLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -4),
            sourceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            categoryLabel.bottomAnchor.constraint(equalTo: sourceLabel.topAnchor, constant: -4),
            categoryLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
}

// MARK: - obj-c

@objc private extension FullNewView {
    func tapCloseButton() {
        let animation = CATransition()
        animation.duration = 0.4
        animation.timingFunction = CAMediaTimingFunction(name: .default)
        animation.type = .reveal
        animation.subtype = .fromBottom
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.popViewController(animated: false)
    }
    
    func tapSourceLabel() {
        guard let url = viewModel?.getNewURL() else { return }
        UIApplication.shared.open(url)
    }
}

// MARK: - FullNewViewModelToViewProtocol

extension FullNewView: FullNewViewModelToViewProtocol {
    func updateDataWith(new: New?) {
        imageView.imageFromServerURL(new?.titleImageUrl)
        titleLabel.text = new?.title
        descriptionLabel.text = new?.description
        dateLabel.text = new?.publishedDate?.dateFromJSON()
        sourceLabel.text = new?.fullUrl?.absoluteString
        categoryLabel.text = "Категория: " + (new?.categoryType ?? "")
        
        let tapSourceLabel = UITapGestureRecognizer(target: self, action: #selector(tapSourceLabel))
        sourceLabel.addGestureRecognizer(tapSourceLabel)
    }
}
