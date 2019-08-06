//
//  HeroTableViewController.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController {

    var presentor: ViewToPresenterProtocol?
    var recentHeroArray = [HeroModel]()
    var favoriteHeroArray = [HeroModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentor?.startFetchingHero()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return recentHeroArray.count
        }
        
        return favoriteHeroArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HeroTableViewController: PresenterToViewProtocol {
    
    func showHero(recents: [HeroModel], favorites: [HeroModel]) {
        recentHeroArray = recents
        favoriteHeroArray = favorites
        tableView.reloadData()
    }
}
