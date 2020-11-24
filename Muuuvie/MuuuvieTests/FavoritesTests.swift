//
//  MuuuvieTests.swift
//  MuuuvieTests
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import XCTest
import Nimble
import Quick

@testable import Muuuvie

class FavoritesTests: QuickSpec {

    override
    func spec() {
        beforeEach {
            Favorites.instance.userDefaults = UserDefaultsMock()
            Favorites.instance.getFromLocalStorage()
        }
        
        describe("when adding a movie to the Favorites list") {
            
            context("and it isnt in the favorites list") {
                
                it("it should add the movie to the list") {
                    Favorites.instance.toggle(item: MovieDetailModel.mocked)
                    expect(Favorites.instance.isInFavoritesList(item: MovieDetailModel.mocked)).to(beTrue())
                }
                
                it("it should return true on toggle") {
                    expect(Favorites.instance.toggle(item: MovieDetailModel.mocked)).to(beTrue())
                }
                
                it("it should increase the size of items array") {
                    expect(Favorites.instance.items.count).to(equal(0))
                    
                    Favorites.instance.toggle(item: MovieDetailModel.mocked)
                    
                    expect(Favorites.instance.items.count).to(equal(1))
                }

            }
            
            context("and it is in the favorites list") {
                beforeEach {
                    Favorites.instance.toggle(item: MovieDetailModel.mocked)
                }
                
                it("it should remove the item from the list") {
                    Favorites.instance.toggle(item: MovieDetailModel.mocked)
                    expect(Favorites.instance.isInFavoritesList(item: MovieDetailModel.mocked)).to(beFalse())
                }
                
                it("it should return false from toggle") {
                    expect(Favorites.instance.toggle(item: MovieDetailModel.mocked)).to(beFalse())
                }
                
                it("it should decrease the size of the items list") {
                    expect(Favorites.instance.items.count).to(equal(1))
                    
                    Favorites.instance.toggle(item: MovieDetailModel.mocked)
                    
                    expect(Favorites.instance.items.count).to(equal(0))
                }

            }

        }
        
    }

}
