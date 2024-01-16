//
//  MainProductsCell.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/14/24.
//

import Kingfisher
import UIKit

class MainProductsCell: UITableViewCell {
    static let identifier = "MainProductsCell"
    
    var mainProductsDetail: MainProductDataObject? {
        didSet { setupData() }
    }
    
    private lazy var container: UIView = {
        var view = UIView()
        return view
    }()
    
    private lazy var productImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .SFUIDisplay.Regular.size(of: 13)
        label.textColor = .MainScreen.MainProductCell.descriptionTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .SFUIDisplay.Bold.size(of: 17)
        label.textColor = .MainScreen.MainProductCell.titleTextColor
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .SFUIDisplay.Medium.size(of: 13)
        label.textColor = .MainScreen.MainProductCell.priceTextColor
        label.layer.borderColor = UIColor.MainScreen.MainProductCell.priceBorderColor.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        container.addAutoLayoutSubviews(productImage, descriptionLabel, titleLabel, priceLabel, divider)
        contentView.addAutoLayoutSubview(container)
        setupLayouts()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        priceLabel.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension MainProductsCell {
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.topAnchor.constraint(equalTo: self.topAnchor),
            
            productImage.heightAnchor.constraint(equalToConstant: Constants.ProductImage.size.height),
            productImage.widthAnchor.constraint(equalToConstant: Constants.ProductImage.size.width),
            productImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.ProductImage.leading),
            productImage.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: Constants.ProductImage.bottom),
            productImage.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.ProductImage.top),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.TitleLabel.top),
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: Constants.TitleLabel.leading),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.trailing),

            divider.heightAnchor.constraint(equalToConstant: 0.5),
            divider.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.trailing),
            priceLabel.heightAnchor.constraint(equalToConstant: Constants.PriceLabel.size.height),
            priceLabel.widthAnchor.constraint(equalToConstant: Constants.PriceLabel.size.width),
            priceLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: Constants.PriceLabel.bottom),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.DescriptionLabel.top),
            descriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.trailing),
            descriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: Constants.DescriptionLabel.leading),
            descriptionLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: Constants.DescriptionLabel.bottom)
        ])
    }
    
    private func setupData() {
        guard let mainProductsDetail = mainProductsDetail else { return }
        titleLabel.text = mainProductsDetail.title
        descriptionLabel.text = mainProductsDetail.description
//        if let urlString = mainProductsDetail.imageUrl, let url = URL(string: urlString) {
//            productImage.kf.setImage(with: url)
//        }
        priceLabel.text = formatPrice()
    }
}

extension MainProductsCell {
    private func formatPrice() -> String? {
        guard let price = mainProductsDetail?.price else { return nil }
        return String(format: "от %@ %@", price, "р")
    }
}

fileprivate struct Constants {
    static let trailing: CGFloat = -24
    
    struct ProductImage {
        static let size: CGSize = CGSize(width: 132, height: 132)
        static let leading: CGFloat = 16
        static let top: CGFloat = 24
        static let bottom: CGFloat = -24
    }
    
    struct TitleLabel {
        static let top: CGFloat = 8
        static let height: CGFloat = 20
        static let leading: CGFloat = 32
    }
    
    struct DescriptionLabel {
        static let top: CGFloat = 8
        static let leading: CGFloat = 32
        static let bottom: CGFloat = -16
    }
    
    struct PriceLabel {
        static let size = CGSize(width: 87, height: 32)
        static let bottom: CGFloat = -16
    }
    
   
}
