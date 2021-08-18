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
        CoinAPI.loadAssets { assets in
            print(assets)
        }

        CoinAPI.loadRates { rates in
            print(rates)
        }
        
        CoinAPI.getAsset(with: "bitcoin", completionBlock: { asset in
            print(asset.data)
        })
        
        CoinAPI.getRate(for: "bitcoin", completionBlock: { rate in
            print(rate.data)
        })
    }
}

