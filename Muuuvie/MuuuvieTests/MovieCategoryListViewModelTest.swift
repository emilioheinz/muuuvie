//
//  MovieCategoryListViewModelTest.swift
//  MuuuvieTests
//
//  Created by Camille Grings on 01/12/20.
//

import XCTest
import Nimble
import Quick

@testable import Muuuvie

class MovieCategoryListViewModelTest: QuickSpec {
    
    override
    func spec() {
        
        var viewModel: MovieCategoryListViewModel!
        
        beforeEach {
            viewModel = MovieCategoryListViewModel()
        }
        
        describe("when accessing screen") {
            
            context("and called request with success") {
                
                it("it should load categories accordin to enum") {
                    viewModel.fetchMovieCategoryList()

                    expect(viewModel.categories.count).toEventually(equal(MovieCategoryEnum.allCases.count))
                }
                
                it("it should load four categories") {
                    viewModel.fetchMovieCategoryList()

                    expect(viewModel.loadedCategories).toEventually(equal(4))
                }
                
                it("it should not have any error") {
                    viewModel.fetchMovieCategoryList()

                    expect(viewModel.hasError).toEventually(equal(false))
                }
                
                it("it should not have any categories with error") {
                    viewModel.fetchMovieCategoryList()

                    expect(viewModel.categoriesWithErrorResponse).toEventually(equal(0))
                }
                
                it("it should stop loading") {
                    viewModel.fetchMovieCategoryList()

                    expect(viewModel.isLoading).toEventually(equal(false))
                }
            }
            
        }
        
    }
}
