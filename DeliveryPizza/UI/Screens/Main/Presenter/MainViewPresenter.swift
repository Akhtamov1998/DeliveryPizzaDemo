//
//  MainViewPresenter.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/13/24.
//

import Foundation
import UIKit.UINavigationController

protocol MainViewInput {
    var navController: UINavigationController? { get }
    func updateUI()
    func startLoading()
    func stopLoading()
}

protocol MainViewOutput {
    var productsCell: [MainProductDataObject] { get }
    var categoryCell: [MainCategoryDataObject] { get }
    var bannerCell: [MainBannerDataObject] { get }
    func categoryAction(data: MainCategoryDataObject?)
    func getProducts()
}

class MainViewPresenter: MainViewOutput {
  
    let mainScreenUseCase: MainScreenUseCase
    var view: MainViewInput? = nil
    init(useCase: MainScreenUseCase = DefaultMainScreenUseCase()) {
        mainScreenUseCase = useCase
    }
    
    var productsCell: [MainProductDataObject] = [
//        MainProductDataObject(title: "Ветчина и грибы", image: "", description: "Ветчина, шампиньоны, увеличинная порция моцареллы, томатный соус", price: "345"),
//        MainProductDataObject(title: "Баварские колбаски", image: "", description: "Баварские колбаски, ветчина, пикантная пепперони, острая чоризо, мацарелла, томатный соус", price: "345"),
//        MainProductDataObject(title: "Баварские колбаски", image: "", description: "Баварские колбаски, ветчина, пикантная пепперони, острая чоризо, мацарелла, томатный соус", price: "345"),
//        MainProductDataObject(title: "Баварские колбаски", image: "", description: "Баварские колбаски, ветчина, пикантная пепперони, острая чоризо, мацарелла, томатный соус", price: "345"),
//        MainProductDataObject(title: "Ветчина и грибы", image: "", description: "Ветчина, шампиньоны, увеличинная порция моцареллы, томатный соус", price: "345"),
//        MainProductDataObject(title: "Ветчина и грибы", image: "", description: "Ветчина, шампиньоны, увеличинная порция моцареллы, томатный соус", price: "345"),
//        MainProductDataObject(title: "Ветчина и грибы", image: "", description: "Ветчина, шампиньоны, увеличинная порция моцареллы, томатный соус", price: "345")
        
    ]
    
    var categoryCell: [MainCategoryDataObject] = [
        MainCategoryDataObject(title: "Пицца"),
        MainCategoryDataObject(title: "Комбо"),
        MainCategoryDataObject(title: "Десерты"),
        MainCategoryDataObject(title: "Напитки"),
        MainCategoryDataObject(title: "Бургеры"),
        MainCategoryDataObject(title: "Хот-Дог"),
    ]
    
    var bannerCell: [MainBannerDataObject] = [
        MainBannerDataObject(image: "banner_1"),
        MainBannerDataObject(image: "banner_1"),
        MainBannerDataObject(image: "banner_1"),
    ]
    
    func categoryAction(data: MainCategoryDataObject?) {
        //TODO: Request to server to get according category objects
    }
    
    func getProducts() {
        mainScreenUseCase.getProducts { [weak self] result in
            guard let self = self else { return }
            view?.startLoading()
            switch result {
            case .success(let response):
                productsCell = response
                view?.updateUI()
                view?.stopLoading()
            case .failure(let error):
                print(error.localizedDescription)
                view?.stopLoading()
            }
        }
    }
}
