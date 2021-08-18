//
//  RateEndPointModel.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/10/21.
//

import Foundation

struct SingleRateEndPointModel: Codable, CoinProtocol {
    var data: RateModel
    var timestamp: Int
}
