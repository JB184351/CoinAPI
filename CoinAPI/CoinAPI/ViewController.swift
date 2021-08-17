//
//  ViewController.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var listOfCurrencies = [AssetModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrencies()
    }
    
    private func loadCurrencies() {
        CoinAPI.loadEndpoint(with: .singleAsset)
        CoinAPI.loadEndpoint(with: .singleRate)
        CoinAPI.loadEndpoint(with: .assets)
        CoinAPI.loadEndpoint(with: .rates)
    }
}

