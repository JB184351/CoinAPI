//
//  RateEndPointModel.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/10/21.
//

import Foundation

class RateEndPointModel: Codable {
    var data: RateModel
    var timestamp: Int
    
    init(data: RateModel, timestamp: Int) {
        self.data = data
        self.timestamp = timestamp
    }
}

//class SingleRateEndPointModel: RateEndPointModel {
//    var singleData: RateModel
//
//    init(data: [RateModel]?, timestamp: Int, singleData: RateModel) {
//        self.singleData = singleData
//        super.init(data: nil, timestamp: timestamp)
//    }
//
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
//}
