//
//  NetworkTests.swift
//  AppBackFrontTests
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import XCTest

@testable import AppBackFront
final class NetworkTests: XCTestCase {
    var network: Network!
    
    override func setUpWithError() throws {
        network = Network(urlProtocol: URLSessionMock.self)
    }
    
    override func tearDownWithError() throws {
        network = nil
    }
    
    func testRequestDataNFTData_ShouldBe3() {
        let expectation = XCTestExpectation(description: "carga en callback de nftData")
        network.requestData(url: .nftData, type: NFTData.self) { result, failure in
            isFailure(failure)
            let list = try! XCTUnwrap(result?.nftList)
            XCTAssertEqual(list.count,3)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testRequestDataWalletData_ShouldBe3() {
        let expectation = XCTestExpectation(description: "carga en callback de walletData")
        network.requestData(url: .wallet, type: WalletData.self) { result, failure in
            isFailure(failure)
            let list = try! XCTUnwrap(result?.latestTransactionsCell?.listOfTransactions)
            XCTAssertEqual(list.count,4)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testImage_Should() {
        let expectation = XCTestExpectation(description: "carga en callback de image")
        network.requestImage(url: TestURL.image) { result, failure in
            isFailure(failure)
            let image = try! XCTUnwrap(result)
            XCTAssertEqual(image.size.width, 50)
            expectation.fulfill()
        }
        wait(for: [expectation],timeout: 1)
    }
    
}

func isFailure(_ failure: Error?) {
    if failure != nil {
        XCTFail("no se ha podido convertir")
    }
}
