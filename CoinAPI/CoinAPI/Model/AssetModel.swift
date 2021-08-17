//
//  CurrencyModel.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/5/21.
//

import Foundation

struct AssetModel: Codable {
    var id: String
    var rank: String
    var symbol: String
    var name: String
    var supply: String
    var maxSupply: String?
    var marketCapUsd: String
    var volumeUsd24Hr: String
    var priceUsd: String
    var changedPercent24Hr: String?
    var vwap24Hr: String?
    var explorer: String?
}

/*
 {
 "id": "bitcoin",
 "rank": "1",
 "symbol": "BTC",
 "name": "Bitcoin",
 "supply": "18781362.0000000000000000",
 "maxSupply": "21000000.0000000000000000",
 "marketCapUsd": "869364226065.6707372827027398",
 "volumeUsd24Hr": "23665519976.8197427402195524",
 "priceUsd": "46288.6677795609677979",
 "changePercent24Hr": "5.6391762161987420",
 "vwap24Hr": "45396.6710601750351699",
 "explorer": "https://blockchain.info/"
 },
 */
