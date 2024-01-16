//
//  MainViewController.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/13/24.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    var navController: UINavigationController? {
        navigationController
    }
    
    var output: MainViewOutput
    private var selectedIndexRowCategory: Int = 0
    
    private var loadingIndicator: UIActivityIndicatorView = {
       var loadingIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            loadingIndicator.style = .large
        }
        loadingIndicator.backgroundColor = .black
        return loadingIndicator
    }()
    
    private lazy var blurView: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2
        return view
    }()
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets.zero
        tableView.register(MainProductsCell.self, forCellReuseIdentifier: MainProductsCell.identifier)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.backgroundColor = .MainScreen.backgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var categoryView: UIView = {
        let view = CategoryView()
        view.categoryCollectionView.delegate = self
        view.categoryCollectionView.dataSource = self
        return view
    }()
    
    init(output: MainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .MainScreen.backgroundColor
        view.addAutoLayoutSubviews(tableView, blurView, loadingIndicator)
        output.getProducts()
        setupLayout()
    }
}

extension MainViewController: MainViewInput {
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadSections([1], with: .none)
        }        
    }
    
    func startLoading() {
        loadingIndicator.startAnimating()
        blurView.isHidden = false
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
        blurView.isHidden = true
    }
}

extension MainViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            blurView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            blurView.topAnchor.constraint(equalTo: self.view.topAnchor),
            
            loadingIndicator.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
        ])
    }
}

//MARK: - tableview delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return output.productsCell.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            cell.bannerCollectionView.delegate = self
            cell.bannerCollectionView.dataSource = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainProductsCell.identifier, for: indexPath) as! MainProductsCell
            if indexPath.section == 1 && indexPath.row == 0 {
                cell.layer.cornerRadius = 20
                cell.layer.maskedCorners = [
                    .layerMinXMinYCorner,
                    .layerMaxXMinYCorner
                ]
            }
            cell.mainProductsDetail = output.productsCell[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return Constants.bannerCellHeight
        } else {
            return Constants.productCellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return Constants.categoryHeaderHeight
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return categoryView
        } else {
            return UIView()
        }
       }
}

//MARK: - Collection delegate
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return output.bannerCell.count
        }
        if collectionView.tag == 2 {
            return output.categoryCell.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainBannerCell.identifier, for: indexPath) as! MainBannerCell
            cell.imagePath = output.bannerCell[indexPath.row].image
            return cell
        }
        
        if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCell.identifier, for: indexPath) as! MainCategoryCell
            cell.buttonAction = { [weak self] result in
                guard let self = self else { return }
                self.output.categoryAction(data: result)
                self.selectedIndexRowCategory = indexPath.row
                collectionView.reloadData()
            }
            cell.isChosen = (indexPath.row == self.selectedIndexRowCategory)
            cell.mainCategoryDetail = output.categoryCell[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}


fileprivate struct Constants {
    static let categoryHeaderHeight: CGFloat = 80
    static let bannerCellHeight: CGFloat = 140
    static let productCellHeight: CGFloat = 170
}
