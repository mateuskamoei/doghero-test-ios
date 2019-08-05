//
//  HeroModel.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation
import ObjectMapper

private let IS_SUPERHERO = "is_superhero"
private let USER = "user"
private let ADDRESS = "address_neighborhood"
private let PRICE = "price"

class HeroModel: Mappable {
    
    internal var isSuperhero: Bool?
    internal var user: UserModel?
    internal var address: String?
    internal var price: Int?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        isSuperhero <- map[IS_SUPERHERO]
        user <- map[USER]
        address <- map[ADDRESS]
        price <- map[PRICE]
    }
    
}
