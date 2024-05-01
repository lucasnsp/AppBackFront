//
//  HomeServiceTests.swift
//  AppBackFrontTests
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import XCTest

@testable import AppBackFront
final class HomeServiceTests: XCTestCase {
    var network: Network!
    var sut: HomeService!
    
    
    override func setUpWithError() throws {
        network = Network(urlProtocol: URLSessionMock.self)
        sut = HomeService(network: network)
        
    }

    override func tearDownWithError() throws {
        network = nil
        sut = nil
    }
    
    func testGetHome_ShouldBe() {
        let expectation = XCTestExpectation(description: "carga en callback HomeService.getHome")
        sut.getHome { result, failure in
            isFailure(failure)
            let result = try! XCTUnwrap(result)
            let list = try! XCTUnwrap(result.nftList)
          
            XCTAssertEqual(list.count, 3)
            expectation.fulfill()
        }
        wait(for: [expectation],timeout: 5)
    }
}
