//
//  GenericService.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 07/09/23.
//

import Foundation

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case network(name: String)
}

enum TypeFetch {
    case mock
    case request
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

