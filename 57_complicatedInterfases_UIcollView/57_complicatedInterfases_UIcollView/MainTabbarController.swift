//
//  MainTabbarController.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 04.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit


class MainTabbarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowVC = ListViewController()
        let compVC = CompositionalVC()
        
        viewControllers = [ generateViewControllers(rootController: compVC, title: "Compositional", image:#imageLiteral(resourceName: "high_priority")),generateViewControllers(rootController: flowVC, title: "Flow", image:#imageLiteral(resourceName: "gallery"))]
    }
    
    
    //MARK: - func for generate vc
    private func generateViewControllers(rootController: UIViewController,title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }

}
