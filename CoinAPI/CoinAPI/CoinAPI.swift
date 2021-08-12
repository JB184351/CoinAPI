//
//  CoinAPI.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/5/21.
//

import Foundation

struct CoinAPI {
    static func getCurrencyInfo(completionBlock: @escaping (AssetEndPointModel) -> (Void), with id: String?) {
        if let url = URL(string: "https://api.coincap.io/v2/assets\((id) ?? "")") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(AssetEndPointModel.self, from: data)
                        completionBlock(parsedJSON)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    static func getRateForCurrency(completionBlock: @escaping (RateEndPointModel) -> (Void), with id: String?) {
        if let url = URL(string: "https://api.coincap.io/v2/rates\((id) ?? "")") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(RateEndPointModel.self, from: data)
                        completionBlock(parsedJSON)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
}

