//
//  WalletService.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit
import Alamofire


protocol WalletServiceDelegate: GenericService {
     func getWalletFromJson(completion: @escaping completion<WalletData?>)
     func getWallet(completion: @escaping completion<WalletData?>)
}

class WalletService: WalletServiceDelegate {
    
    func getWallet(completion: @escaping completion<WalletData?>) {
        let url: String = "https://run.mocky.io/v3/70318389-3b0c-47cf-a529-e66ca8cf050f"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            debugPrint(response)
            switch response.result {
            case.success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case.failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
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
