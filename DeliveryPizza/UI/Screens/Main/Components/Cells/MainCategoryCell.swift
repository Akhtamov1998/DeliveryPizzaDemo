//
//  MainCategoryCell.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/14/24.
//

import UIKit

class MainCategoryCell: UICollectionViewCell {
    static let identifier: String = "MainCategoryCell"
    
    private lazy var categoryButton: UIButton = {
        $0.setTitleColor(.MainScreen.CategoryCell.textColor, for: .normal)
        $0.titleLabel?.font = .SFUIDisplay.Medium.size(of: Constants.CategoryButton.fontSize)
        $0.layer.borderColor = UIColor.MainScreen.CategoryCell.borderColor.cgColor
        $0.layer.borderWidth = 1
        return $0
    }(UIButton())
    
    var isChosen: Bool = false {
        didSet { updateButtonState() }
    }
    
    var buttonAction: ((MainCategoryDataObject?) -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addAutoLayoutSubview(categoryButton)
        setupLayout()
        setupActions()
    }
    
    var mainCategoryDetail : MainCategoryDataObject? {
        didSet { updateUI() }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
        categoryButton.layer.cornerRadius = categoryButton.frame.size.height / 2
    }
    
}

extension MainCategoryCell {
    
    private func setupActions() {
        categoryButton.addTarget(self, action: #selector(categoryAction), for: .touchUpInside)
    }
    
    @objc func categoryAction() {
        buttonAction?(mainCategoryDetail)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            categoryButton.widthAnchor.constraint(equalToConstant: Constants.CategoryButton.width),
            categoryButton.heightAnchor.constraint(equalToConstant: Constants.CategoryButton.height),
            categoryButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            categoryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
//            categoryButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
        ])
    }
    
    private func updateButtonState() {
        categoryButton.backgroundColor = isChosen ? .MainScreen.CategoryCell.selectedBackground : .clear
        categoryButton.titleLabel?.font = isChosen ? .SFUIDisplay.Bold.size(of: Constants.CategoryButton.fontSize) : .SFUIDisplay.Medium.size(of: Constants.CategoryButton.fontSize)
        categoryButton.layer.borderColor = isChosen ? UIColor.MainScreen.CategoryCell.selectedBorderColor.cgColor
        : UIColor.MainScreen.CategoryCell.borderColor.cgColor
        categoryButton.layoutIfNeeded()
        // TODO: trigger button text bold, backgroundColor
    }
    
    private func updateUI() {
        guard let mainCategoryDetail = mainCategoryDetail else { return }
        categoryButton.setTitle(mainCategoryDetail.title, for: .normal)
    }
}

fileprivate struct Constants {
    struct CategoryButton {
        static let fontSize: CGFloat = 13
        static let width: CGFloat = 88
        static let height: CGFloat = 32
    }
}
