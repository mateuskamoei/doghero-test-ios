//
//  HeroPresenter.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 06/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation

class HeroPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingHero() {
        interactor?.fetchHero()
    }
}

extension HeroPresenter: InteractorToPresenterProtocol{
    
    func heroesFetchedSuccess(recents: [HeroModel], favorites: [HeroModel]) {
        view?.showHero(recents: recents, favorites: favorites)
    }
}
