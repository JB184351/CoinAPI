//
//  RateModel.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/10/21.
//

import Foundation

struct RateModel: Codable {
    var id: String
    var symbol: String
    var currencySymbol: String?
    var type: String
    var rateUsd: String
}


/*
 "id": "barbadian-dollar",
 "symbol": "BBD",
 "currencySymbol": "$",
 "type": "fiat",
 "rateUsd": "0.5000000000000000"
 */
