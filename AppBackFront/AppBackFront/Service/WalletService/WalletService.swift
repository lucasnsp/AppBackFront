//
//  WalletService.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit


protocol WalletServiceDelegate: GenericService {
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
}
