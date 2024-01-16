//
//  MainBannerCell.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/14/24.
//

import UIKit.UICollectionViewCell

class MainBannerCell: UICollectionViewCell {
    static let identifier: String = "MainBannerCell"
    
    private lazy var bannerImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var imagePath: String? {
        didSet { updateData() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addAutoLayoutSubview(bannerImageView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 2
    }
}

extension MainBannerCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bannerImageView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func updateData() {
        guard let imagePath = imagePath else { return }
        bannerImageView.image = UIImage(named: imagePath)
    }
}
