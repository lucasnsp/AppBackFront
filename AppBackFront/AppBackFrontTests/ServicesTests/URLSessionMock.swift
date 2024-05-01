//
//  URLSessionMock.swift
//  AppBackFrontTests
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import Foundation

@testable import AppBackFront
final class URLSessionMock: URLProtocol {
    let urlnftDataLastPathComponent = "ac3f7ec4-c487-4332-b4bd-1f2f15aef6f5"
    let urlwalletLastPathComponent = "70318389-3b0c-47cf-a529-e66ca8cf050f"
    let urlPngLastPathComponent = "imageTest.jpg"
    let testURL = TestURL()
    func getMockNftData() {
        if let data = try? Data(contentsOf: TestURL.nftData) {
            client?.urlProtocol(self, didLoad: data)
            if let response = HTTPURLResponse(url: TestURL.nftData, statusCode: 200, httpVersion: nil, headerFields: ["Content-Type": "application/json"]) {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
        }
    }
    func getMockWalletData() {
        if let data = try? Data(contentsOf: TestURL.wallet) {
            client?.urlProtocol(self, didLoad: data)
            if let response = HTTPURLResponse(url: TestURL.wallet, statusCode: 200, httpVersion: nil, headerFields: ["Content-Type": "application/json"]) {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
        }
    }
    func getMockImage() {
        if let data = try? Data(contentsOf: TestURL.image) {
            client?.urlProtocol(self, didLoad: data)
            if let response = HTTPURLResponse(url: TestURL.image, statusCode: 200, httpVersion: nil, headerFields: ["Content-Type": "image/png"]) {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
        }
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        if let url = request.url {
            switch url.lastPathComponent {
            case urlnftDataLastPathComponent: getMockNftData()
            case urlwalletLastPathComponent: getMockWalletData()
            case urlPngLastPathComponent: getMockImage()
            default: break
            }
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
    
}


struct TestURL: URLLocator {
    static let nftData: URL = Bundle(for: NetworkTests.self).url(forResource: "HomeDataTests", withExtension: "json")!
    
    static let wallet: URL = Bundle(for: NetworkTests.self).url(forResource: "WalletDataTests",withExtension: "json")!
    
    static let image: URL = Bundle(for: NetworkTests.self).url(forResource: "imageTest",withExtension: "jpg")!
}
