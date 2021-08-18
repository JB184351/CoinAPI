//
//  Assets.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/10/21.
//

import Foundation

struct AssetsEndPointModel: Codable, CoinProtocol {
    var data: [AssetModel]
    var timestamp: Int
}
