//
//  WalletViewModelTests.swift
//  AppBackFrontTests
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import XCTest

@testable import AppBackFront
final class WalletViewModelTests: XCTestCase {
    
    var sut: WalletViewModel!
    var service: WalletService!
    var network: Network!
    
    override func setUpWithError() throws {
        network = Network(urlProtocol: URLSessionMock.self)
        service = WalletService(network: network)
        sut = WalletViewModel(service: service)
    }
    
    override func tearDownWithError() throws {
        network = nil
        service = nil
        sut = nil
    }
    
    func testGetWallet_ShoulBe4() {
        let expectation = XCTestExpectation(description: "Callback Wallet")
        service.getWallet { result, failure in
            isFailure(failure)
            let list = try! XCTUnwrap(result?.latestTransactionsCell?.listOfTransactions)
            XCTAssertEqual(list.count, 4)
            expectation.fulfill()
        }
        wait(for: [expectation],timeout: 5)
        
    }
    
}
