//
//  HeroProtocols.swift
//  doghero-test
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import Foundation

protocol InteractorToPresenterProtocol: class {
    func heroesFetchedSuccess(recents: [HeroModel], favorites: [HeroModel])
}
