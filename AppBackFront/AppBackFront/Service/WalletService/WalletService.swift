//
//  WalletService.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit


protocol WalletServiceDelegate: GenericService {
     func getWalletFromJson(completion: @escaping completion<WalletData?>)
     func getWallet(completion: @escaping completion<WalletData?>)
}

final class WalletService: WalletServiceDelegate {
    
    let network: Network
    init(network: Network  = .shared) {
        self.network = network
    }
    
    func getWallet(completion: @escaping completion<WalletData?>) {
        
        network.requestData(url: .wallet, type: WalletData.self) { result, failure in
                guard let result  else { return completion(nil, failure) }
                completion(result, nil)
            }
        }
    
    func getWalletFromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(result, nil)
            } catch  {
                completion(nil, Error.fileDecodingFailed(name: "WalletData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "WalletData"))
        }
    }
}
