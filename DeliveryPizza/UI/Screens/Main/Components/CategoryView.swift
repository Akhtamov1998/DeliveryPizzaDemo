//
//  CategoryView.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/15/24.
//

import UIKit

class CategoryView: UIView {
    
    lazy var categoryCollectionView: UICollectionView = {
        $0.register(MainCategoryCell.self, forCellWithReuseIdentifier: MainCategoryCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .MainScreen.backgroundColor
        $0.tag = 2
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: categoryCollectionViewFlowLayout))
    
    private lazy var categoryCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = CGSize(width: Constants.CategoryCollection.width, height: Constants.CategoryCollection.height)
        $0.sectionInset = UIEdgeInsets(top: 16, left: Constants.CategoryCollection.leftInset, bottom: 16,  right: Constants.CategoryCollection.rightInset)
        return $0
    }(UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .MainScreen.backgroundColor
        self.addAutoLayoutSubview(categoryCollectionView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension CategoryView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            categoryCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoryCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: -5),
            categoryCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
}
fileprivate struct Constants {
    struct CategoryCollection {
        static let leftInset: CGFloat = 16
        static let rightInset: CGFloat = 16
        static let height: CGFloat = 32
        static let width: CGFloat = 88
        static let top: CGFloat = 24
    }
}
