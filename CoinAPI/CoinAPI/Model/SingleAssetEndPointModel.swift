//
//  SingleAssetEndPointModel.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/16/21.
//

import Foundation

struct SingleAssetEndPointModel: Codable, CoinProtocol {
    var data: AssetModel
    var timestamp: Int
}
