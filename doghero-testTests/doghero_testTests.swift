//
//  doghero_testTests.swift
//  doghero-testTests
//
//  Created by Mateus Kamoei on 05/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import XCTest
@testable import doghero_test

class doghero_testTests: XCTestCase {

    var recents: [HeroModel]!
    var favorites: [HeroModel]!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Tests fetching and parsing heroes
    func testInteractor() {
        let heroInteractor = HeroInteractor()
        heroInteractor.presenter = self
        heroInteractor.fetchHero()
        
        let firstRecentHeroFavorite = recents[0].isFavorite
        heroInteractor.toggleHeroFavorite(indexPath: IndexPath(row: 0, section: 0), recents: recents, favorites: favorites)
        XCTAssertEqual(firstRecentHeroFavorite, !recents[0].isFavorite)
    }
}

extension doghero_testTests: InteractorToPresenterProtocol {
    
    func heroesFetchedSuccess(recents: [HeroModel], favorites: [HeroModel]) {
        self.recents = recents
        self.favorites = favorites
        XCTAssertGreaterThan(recents.count, 0)
        XCTAssertGreaterThan(favorites.count, 0)
    }
    
    func toggleHeroFavoriteSuccess(recents: [HeroModel], favorites: [HeroModel]) {
        
    }
    
}
