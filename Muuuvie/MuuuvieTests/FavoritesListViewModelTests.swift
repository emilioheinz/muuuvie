//
//  FavoritesListViewModelTests.swift
//  MuuuvieTests
//
//  Created by Emilio Heinzmann on 26/11/20.
//

import XCTest
import Nimble
import Quick

@testable import Muuuvie

class FavoritesListViewModelTests: QuickSpec {
    
    override
    func spec() {
        var viewModel: FavoritesListViewModel!
        
        beforeEach {
            Favorites.instance.userDefaults = UserDefaultsMock()
            Favorites.instance.getFromLocalStorage()
            
            viewModel = FavoritesListViewModel(favoritesInstance: Favorites.instance)
        }
        
        describe("when toggling a movie on the Favorites list") {
            
            func addMovieToTheList() {
                Favorites.instance.toggle(item: MovieDetailModel.mocked)
                viewModel.getFavorittedItems()
            }
            
            context("and it isnt in the favorites list") {

                it("it should update the favoritedMovies array") {
                    addMovieToTheList()
                    
                    expect(viewModel.favoritedMovies.count).to(equal(1))
                }
                
                it("it should not update the favoritedArtists array") {
                    addMovieToTheList()
                    
                    expect(viewModel.favoritedArtists.count).to(equal(0))
                }

            }
            
            context("and it is already in the favorites list") {
                beforeEach {
                    addMovieToTheList()
                }
                

                it("it should remove the movie from the array") {
                    expect(viewModel.favoritedMovies.count).to(equal(1))
                    
                    addMovieToTheList()
                    
                    expect(viewModel.favoritedMovies.count).to(equal(0))
                }
                
                it("it should not update the favoritedArtists array") {
                    expect(viewModel.favoritedArtists.count).to(equal(0))
                }

            }

        }
        
        describe("when toggling a artist on the Favorites list") {
            
            func addArtistToTheList() {
                Favorites.instance.toggle(item: ArtistDetailModel.mocked)
                viewModel.getFavorittedItems()
            }
            
            context("and it isnt in the favorites list") {

                it("it should update the favoritedArtists array") {
                    addArtistToTheList()
                    
                    expect(viewModel.favoritedArtists.count).to(equal(1))
                }
                
                it("it should not update the favoritedMovies array") {
                    addArtistToTheList()
                    
                    expect(viewModel.favoritedMovies.count).to(equal(0))
                }

            }
            
            context("and it is already in the favorites list") {
                
                beforeEach {
                    addArtistToTheList()
                }
                
                it("it should remove the artist from the array") {
                    expect(viewModel.favoritedArtists.count).to(equal(1))
                    
                    addArtistToTheList()
                    
                    expect(viewModel.favoritedArtists.count).to(equal(0))
                }
                
                it("it should not update the favoritedMoview array") {
                    expect(viewModel.favoritedMovies.count).to(equal(0))
                }

            }

        }
        
        describe("when changing selected filter") {
            
            context("and do nothing") {
                
                it("the selected filter should be movie") {
                    
                    expect(viewModel.selectedFilter).to(equal(.movie))
                    
                }
                
            }
            
            context("change the selected filter to artist") {
                
                it("the selected filter should be artist") {
                    
                    viewModel.changeSelectedFilter(newFilter: .artist)
                    expect(viewModel.selectedFilter).to(equal(.artist))
                    
                }
                
            }
            
            context("change the selected filter to movie") {
                
                it("the selected filter should be movie") {
                    
                    viewModel.changeSelectedFilter(newFilter: .movie)
                    expect(viewModel.selectedFilter).to(equal(.movie))
                    
                }
                
            }
            
        }
        
    }

}
