//
//  RatesEndPointModel.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/16/21.
//

import Foundation

struct RatesEndPointModel: Codable {
    var data: [RateModel]
    var timestamp: Int
}
