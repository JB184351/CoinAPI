//
//  ViewController.swift
//  CoinAPI
//
//  Created by Justin Bengtson on 8/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var listOfCurrencies = [CurrencyModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrencies()
    }
    
    private func loadCurrencies() {
//        CoinAPI.getCurrencyInfo(completionBlock: { currency in
//            print(currency)
//        }, with: nil)
        
        CoinAPI.getRateForCurrency(completionBlock: { rates in
            print(rates.data)
        }, with: "/bitcoin")
    }
}

