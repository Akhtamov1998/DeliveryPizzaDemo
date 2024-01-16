//
//  MainTabbarController.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/14/24.
//

import Foundation
import UIKit

class MainTabbarController: UITabBarController {
    private var menuViewController: UIViewController
    private var contactsViewController: UIViewController
    private var profileViewController: UIViewController
    private var basketViewController: UIViewController
    
    init(menuViewController: UIViewController,
         contactsViewController: UIViewController,
         profileViewController: UIViewController,
         basketViewController: UIViewController) {
        self.menuViewController = menuViewController
        self.contactsViewController = contactsViewController
        self.profileViewController = profileViewController
        self.basketViewController = basketViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarMenuControllers()
        addTabbar()
        selectedIndex = 0
        tabBar.selectedItem?.selectedImage = UIImage(named: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = Constants.tabbarHeight
        tabBar.frame.origin.y = view.frame.height - Constants.tabbarHeight
        tabBar.barTintColor = .white
        tabBar.tintColor = .white
    }
    
}

extension MainTabbarController {
    private func setTabBarMenuControllers() {
        menuViewController.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        menuViewController.tabBarItem.tag = 0
        
        contactsViewController.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        contactsViewController.tabBarItem.tag = 1
        
        profileViewController.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        profileViewController.tabBarItem.tag = 2
        
        basketViewController.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        basketViewController.tabBarItem.tag = 3
        
        viewControllers = [menuViewController, contactsViewController, profileViewController, basketViewController]
    }
    
    private func addTabbar() {
        self.delegate = self
        tabBar.backgroundColor = UIColor.white
        tabBar.barTintColor = .white
        tabBar.tintColor = .white
    }
    
    private func configureNavigationBar() {
        
    }
}

extension MainTabbarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            item.selectedImage = UIImage(named: "")
        case 1:
            item.selectedImage = UIImage(named: "")
        case 2:
            item.selectedImage = UIImage(named: "")
        case 3:
            item.selectedImage = UIImage(named: "")
        default: break
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool { return true }
}

fileprivate struct Constants {
    static let tabbarHeight: CGFloat = 86.0
}
