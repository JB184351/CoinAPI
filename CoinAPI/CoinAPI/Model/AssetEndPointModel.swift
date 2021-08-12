//
//  Assets.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/10/21.
//

import Foundation

class AssetEndPointModel: Codable {
    var data: [CurrencyModel]?
    var timestamp: Int
    
    init(data: [CurrencyModel]?, timestamp: Int) {
        self.data = data
        self.timestamp = timestamp
    }
}

//class AssetEndPointModel: AssetModel {
//    var singleData: CurrencyModel
//
//    init(data: [CurrencyModel]?, timestamp: Int, singleData: CurrencyModel) {
//        self.singleData = singleData
//        super.init(data: nil, timestamp: timestamp)
//    }
//
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}
