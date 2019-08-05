//
//  UserModel.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation
import ObjectMapper

private let FIRST_NAME = "first_name"
private let IMAGE_URL = "image_url"

class UserModel: Mappable {
 
    internal var firstName: String?
    internal var imageURL: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        firstName <- map[FIRST_NAME]
        imageURL <- map[IMAGE_URL]
    }
    
}
