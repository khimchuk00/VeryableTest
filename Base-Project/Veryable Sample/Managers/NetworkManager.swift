//
//  NetworkManager.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 17.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Alamofire

protocol LoadDataProtocol {
    func getAccounts(banks: @escaping (Result<[Account], Error>) -> Void)
}

class NetworkManager: LoadDataProtocol {
    private var baseURL = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"

    func getAccounts(banks: @escaping (Result<[Account], Error>) -> Void) {
        AF.request(baseURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in
            switch response.result {
            case .success(let data):
                if let data = data, let decodedValue = try? JSONDecoder().decode([Account].self, from: data) {
                    banks(.success(decodedValue))
                } else {
                    banks(.failure(DefaultError.wrongData))
                }
            case .failure(let error):
                banks(.failure(error))
            }
        }
    }
}
