//
//  CategoryTableViewCell.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/15/24.
//


import UIKit

class CategoryTableViewCell: UITableViewCell {
    static let identifier: String = "CategoryTableVieCell"
    lazy var bannerCollectionView: UICollectionView = {
        $0.register(MainBannerCell.self, forCellWithReuseIdentifier: MainBannerCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .MainScreen.backgroundColor
        $0.tag = 1
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: bannerCollectionViewFlowLayout))
    
    private lazy var bannerCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = CGSize(width: Constants.BannerCollection.width, height: Constants.BannerCollection.height)
        $0.sectionInset = UIEdgeInsets(top: 0, left: Constants.BannerCollection.leftInset, bottom: 0, right: Constants.BannerCollection.rightInset)
        return $0
    }(UICollectionViewFlowLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .MainScreen.backgroundColor
        contentView.addAutoLayoutSubview(bannerCollectionView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension CategoryTableViewCell {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bannerCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            bannerCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            bannerCollectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            bannerCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            ])
    }
}

fileprivate struct Constants {
    struct BannerCollection {
        static let leftInset: CGFloat = 16
        static let rightInset: CGFloat = 16
        static let height: CGFloat = 132
        static let width: CGFloat = 100
    }
}
