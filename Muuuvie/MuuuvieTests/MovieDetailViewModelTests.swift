//
//  MovieDetailViewModelTests.swift
//  MuuuvieTests
//
//  Created by Camille Grings on 05/12/20.
//

import XCTest
import Nimble
import Quick

@testable import Muuuvie

class MovieDetailViewModelTest: QuickSpec {
    
    override
    func spec() {
        
        var viewModel: MovieDetailViewModel!
        let movieId = 590706
        
        beforeEach {
            viewModel = MovieDetailViewModel()
        }
        
        describe("when accessing screen") {
            
            context("and called request with success") {
                
                it("it should load the movie") {
                    viewModel.fetchMovie(id: movieId)

                    expect(viewModel.movie?.id).toEventually(equal(590706))
                }
                
                it("it should load all artists") {
                    viewModel.fetchMovie(id: movieId)

                    expect(viewModel.artists?.count).toEventually(equal(13))
                }
                
                it("it should not have any error") {
                    viewModel.fetchMovie(id: movieId)

                    expect(viewModel.hasError).toEventually(equal(false))
                }
                
                it("it should stop loading") {
                    viewModel.fetchMovie(id: movieId)

                    expect(viewModel.isLoading).toEventually(equal(false))
                }
            }
            
        }
        
    }
}
