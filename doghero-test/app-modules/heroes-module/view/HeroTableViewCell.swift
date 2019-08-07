//
//  HeroTableViewCell.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 06/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import UIKit

protocol HeroTableViewCellDelegate {
    func didTapFavoriteButton(in cell: HeroTableViewCell)
}

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroNeighborhoodLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var superHeroImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    var delegate: HeroTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTapFavoriteButton(_ sender: Any) {
        delegate.didTapFavoriteButton(in: self)
    }
    
}
