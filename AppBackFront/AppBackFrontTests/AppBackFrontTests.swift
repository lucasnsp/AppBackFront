//
//  AppBackFrontTests.swift
//  AppBackFrontTests
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import XCTest

@testable import AppBackFront

final class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    
    
    override func setUpWithError() throws {
        sut = HomeViewModel()
        sut.fetchRequest(.mock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testNumberOfItemsInSection_ShouldBe5() {
        XCTAssertEqual(sut.numberOfItemsInSection, 5)
    }
    
    func testLoadCurrentFilterNFT_ShouldBeTodos() {
        let indexPath = IndexPath(row: 0, section: 0)
        let filterNft = sut.loadCurrentFilterNft(indexPath: indexPath)
        
        XCTAssertEqual(filterNft.title, "Todos")
    }
    
    func testNumberOfRowsInSection_ShouldBe10() {
     
        XCTAssertEqual(sut.numberOfRowsInSection, 10)
    }
    
    func testLoadCurrentNft_ShouldBeMasonYates() {
        let indexPath = IndexPath(row: 0, section: 0)
        let nft = sut.loadCurrentNft(indexPath: indexPath)
        XCTAssertEqual(nft.userName, "Mason Yates")
    }
    
    func testFilterSearchText_ShoudlBe5() {
        let filterText = "o"
        sut.filterSearchText(filterText)
        
        XCTAssertEqual(sut.numberOfRowsInSection, 5)
    }
    
    func testFilterSearchText_ShoudlBe10() {
        let filterText = ""
        sut.filterSearchText(filterText)
        
        XCTAssertEqual(sut.numberOfRowsInSection, 10)
    }
    
    func testSetFilter_ShouldBe() {
        sut.fetchRequest(.mock)
        let indexPath = IndexPath(row: 4, section: 0)
        let searchText = "m"
        sut.setFilter(indexPath: indexPath, searchText: searchText)
        
        XCTAssertEqual(sut.numberOfRowsInSection, 2)
    }
}
