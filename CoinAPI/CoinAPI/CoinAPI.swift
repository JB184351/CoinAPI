//
//  CoinAPI.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/5/21.
//

import Foundation

struct CoinAPI {
    public static func getAsset(completionBlock: @escaping (SingleAssetEndPointModel) -> (Void), with id: String?) {
        load(with: .singleAsset, with: "/bitcoin") { singleAssetModel in
            completionBlock(singleAssetModel as! SingleAssetEndPointModel)
        }
    }
    
    public static func getRate(completionBlock: @escaping (SingleRateEndPointModel) -> (Void), for id: String?) {
        load(with: .singleRate, with: "/bitcoin") { singleRateModel in
            completionBlock(singleRateModel as! SingleRateEndPointModel)
        }
    }
    
    public static func loadAssets(completionBlock: @escaping (AssetsEndPointModel) -> (Void)) {
        load(with: .assets, with: nil) { assetsModel in
            completionBlock(assetsModel as! AssetsEndPointModel)
        }
    }
    
    public static func loadRates(completionBlock: @escaping (RatesEndPointModel) -> (Void)) {
        load(with: .rates, with: nil) { ratesModel in
            completionBlock(ratesModel as! RatesEndPointModel)
        }
    }
    
    private static func load(with endPoint: EndPoint, with id: String?, completionBlock: @escaping (CoinProtocol) -> (Void)) {
        var baseURL = URL(string: "https://api.coincap.io/v2/")
        
        switch endPoint {
        case .assets:
            baseURL?.appendPathComponent("assets")
        case .rates:
            baseURL?.appendPathComponent("rates")
        case .singleAsset:
            baseURL?.appendPathComponent("assets/\(id ?? "")")
        case .singleRate:
            baseURL?.appendPathComponent("rates/\(id ?? "")")
        }
        
        if let url = baseURL {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        switch endPoint {
                        case .assets:
                            let parsedJSON = try jsonDecoder.decode(AssetsEndPointModel.self, from: data)
                            completionBlock(parsedJSON)
                        case .rates:
                            let parsedJSON = try jsonDecoder.decode(RatesEndPointModel.self, from: data)
                            completionBlock(parsedJSON)
                        case .singleAsset:
                            let parsedJSON = try jsonDecoder.decode(SingleAssetEndPointModel.self, from: data)
                            completionBlock(parsedJSON)
                        case .singleRate:
                            let parsedJSON = try jsonDecoder.decode(SingleRateEndPointModel.self, from: data)
                            completionBlock(parsedJSON)
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

