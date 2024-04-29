//
//  Network.swift
//  AppBackFront
//
//  Created by Adrian Iraizos Mendoza on 29/4/24.
//

import Foundation


final class Network {
    static let shared = Network()
    
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func requestData<JSON: Codable>(url: URL, type: JSON.Type, completionHandler: @escaping completion<JSON?>) {
        session.dataTask(with: .nftData) { data, response, error in
        
            guard let status = response as? HTTPURLResponse, (200...299).contains(status.statusCode) else { return completionHandler(nil, Error.network(name: "Status code"))  }
            debugPrint(response.debugDescription)
            guard let data else { return completionHandler(nil, Error.network(name: "Error Data")) }
            do {
                let info = try JSONDecoder().decode(JSON.self, from: data)
                completionHandler(info, nil)
            } catch {
                completionHandler(nil, Error.network(name: "Json error"))
            }
        }.resume()
    }
    
}
