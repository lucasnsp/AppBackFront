//
//  HomeService.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 07/09/23.
//

import UIKit

protocol HomeServiceDelegate: GenericService {
     func getHomeFromJson(completion: @escaping completion<NFTData?>)
}


class HomeService: HomeServiceDelegate {
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
