//
//  CoinAPI.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/5/21.
//

import Foundation

struct CoinAPI {
    private static func getAsset(completionBlock: @escaping (SingleAssetEndPointModel) -> (Void), with id: String?) {
        if let url = URL(string: "https://api.coincap.io/v2/assets\((id) ?? "")") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(SingleAssetEndPointModel.self, from: data)
                        completionBlock(parsedJSON)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    private static func getRate(completionBlock: @escaping (SingleRateEndPointModel) -> (Void), for id: String?) {
        if let url = URL(string: "https://api.coincap.io/v2/rates\((id) ?? "")") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(SingleRateEndPointModel.self, from: data)
                        completionBlock(parsedJSON)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    private static func loadAssets(completionBlock: @escaping (AssetsEndPointModel) -> (Void)) {
        if let url = URL(string: "https://api.coincap.io/v2/assets") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(AssetsEndPointModel.self, from: data)
                        completionBlock(parsedJSON)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    private static func loadRates(completionBlock: @escaping (RatesEndPointModel) -> (Void)) {
        if let url = URL(string: "https://api.coincap.io/v2/rates") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(RatesEndPointModel.self, from: data)
                        completionBlock(parsedJSON)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    public static func loadEndpoint(with endpoint: EndPoint) {
        switch endpoint {
        case .singleAsset:
            getAsset(completionBlock: { asset in
                print("This is the asset endpint for bitcoin \(asset.data)")
            }, with: "/bitcoin")
        case .singleRate:
            getRate(completionBlock: { rate in
                print("This is the rate endpint for bitcoin \(rate.data)")
            }, for: "/bitcoin")
        case .assets:
            loadAssets { assets in
                print("These are the assets \(assets)")
            }
        case .rates:
            loadRates { rates in
                print("These are the currency rates \(rates)")
            }
        }
    }
    
    
    
    //TODO: Make Private Static Endpoint with the EndPoint Model as parameter using an EndPoint Enum
    //Tip:
    
    
    
    
}

