//
//  HeroTableViewController.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController {

    let cellReuseIdentifier = "HeroCell"
    let headerReuseIdentifier = "HeroHeaderView"
    
    var presentor: ViewToPresenterProtocol?
    var recentHeroArray = [HeroModel]()
    var favoriteHeroArray = [HeroModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentor?.startFetchingHero()
        
        let headerNib = UINib(nibName: headerReuseIdentifier, bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: headerReuseIdentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! HeroTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        
        let hero = indexPath.section == 0 ? recentHeroArray[indexPath.row] : favoriteHeroArray[indexPath.row]
        cell.heroNameLabel.text = hero.user?.firstName
        cell.heroNeighborhoodLabel.text = hero.address
        cell.heroImageView.layer.cornerRadius = 32
        if let imageURL = hero.user?.imageURL, let url = URL(string: imageURL) {
            cell.heroImageView.setImageFrom(url: url)
        }
        cell.superHeroImageView.isHidden = hero.isSuperhero ?? false
        cell.chatButton.layer.borderWidth = 1.0
        cell.chatButton.layer.borderColor = UIColor.black.withAlphaComponent(0.12).cgColor
        cell.chatButton.layer.cornerRadius = 5
        cell.bookButton.layer.cornerRadius = 5
        
        let priceAttributedString = NSMutableAttributedString()
        priceAttributedString.normal("R$").bold("\(hero.price ?? 0)")
        cell.priceLabel.attributedText = priceAttributedString
        
        if hero.isFavorite {
            cell.favoriteButton.setImage(UIImage(named: "icon_heart_filled"), for: .normal)
        } else {
            cell.favoriteButton.setImage(UIImage(named: "icon_heart_unfilled"), for: .normal)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerReuseIdentifier) as! HeroHeaderView
        if section == 0 {
            header.headerTitleLabel.text = "Heróis com quem hospedei"
        } else {
            header.headerTitleLabel.text = "Heróis favoritos"
        }
        header.backgroundView = UIView(frame: header.frame)
        header.backgroundView?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension HeroTableViewController: PresenterToViewProtocol {
    
    func showHero(recents: [HeroModel], favorites: [HeroModel]) {
        recentHeroArray = recents
        favoriteHeroArray = favorites
        tableView.reloadData()
    }
}

extension HeroTableViewController: HeroTableViewCellDelegate {
    func didTapFavoriteButton(in cell: HeroTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            presentor?.startTogglingHeroFavorite(indexPath: indexPath, recents: recentHeroArray, favorites: favoriteHeroArray)
        }
    }
}
