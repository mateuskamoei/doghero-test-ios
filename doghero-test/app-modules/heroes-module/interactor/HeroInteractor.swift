//
//  HeroInteractor.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation
import ObjectMapper

class HeroInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchHero() {
        let heroes = MyHeroes.apiAnswer
        let recentHeroesArray = Mapper<HeroModel>().mapArray(JSONArray: heroes["recents"] as! [[String: Any]])
        let favoriteHeroesArray = Mapper<HeroModel>().mapArray(JSONArray: heroes["favorites"] as! [[String: Any]])
        presenter?.heroesFetchedSuccess(recents: recentHeroesArray, favorites: favoriteHeroesArray)
    }
}
