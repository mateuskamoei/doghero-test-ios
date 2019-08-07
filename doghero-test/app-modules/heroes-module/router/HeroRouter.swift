//
//  HeroRouter.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation
import UIKit

class HeroRouter: PresenterToRouterProtocol {
    
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    static func createModule() -> UITabBarController {
        
        let tabBar = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        let navigationController = tabBar.viewControllers?.first as! UINavigationController
        let view = navigationController.viewControllers.first as! HeroTableViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HeroPresenter()
        let interactor: PresenterToInteractorProtocol = HeroInteractor()
        let router: PresenterToRouterProtocol = HeroRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return tabBar
    }
}
