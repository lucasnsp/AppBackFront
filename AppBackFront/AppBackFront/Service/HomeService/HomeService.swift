//
//  HomeService.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 07/09/23.
//

import UIKit

protocol HomeServiceDelegate: GenericService {
     func getHomeFromJson(completion: @escaping completion<NFTData?>)
     func getHome(completion: @escaping completion<NFTData?>)
}


final class HomeService: HomeServiceDelegate {
    
    let network: Network
    
    init(network: Network  = .shared) {
        self.network = network
    }
    
    func getHome(completion: @escaping completion<NFTData?>) {
        network.requestData(url: .nftData, type: NFTData.self) { result, failure in
            guard let result  else { return completion(nil, failure) }
            completion(result, nil)
        }
    }
    
    
    
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData, nil)
            } catch  {
                completion(nil, Error.fileDecodingFailed(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
}
