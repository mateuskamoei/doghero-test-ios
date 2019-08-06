//
//  HeroProtocols.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation
import UIKit

protocol InteractorToPresenterProtocol: class {
    func heroesFetchedSuccess(recents: [HeroModel], favorites: [HeroModel])
}

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingHero()
//    func showMovieController(navigationController:UINavigationController)
    
}

protocol PresenterToViewProtocol: class{
    func showHero(recents: [HeroModel], favorites: [HeroModel])
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UITabBarController
//    func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchHero()
}
