//
//  ExchangeRate.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-08.
//

import SwiftUI

struct ExchangeRate: Codable {
    
    let from: String
    let to: String
    let rate: String
}

func createExchangeList(rates: [ExchangeRate])-> ExchangeList {

   let result = rates.map { rate in
        
        [rate.to, rate.from]
   }.reduce([], +)
    
    let uniques = Array(Set(result))
    
  //  print(uniques)

    let list = ExchangeList()
    
    for i in uniques {
        list.createCurrency(i)
    }
    
    for rate in rates {
        list.addRate(from: rate.from, to: rate.to, value: Double(rate.rate) ?? 0.0)
    }
    
    return list
}

func loadRates() -> [ExchangeRate] {
    
    let rates = (try? loadPropertyList(type: [ExchangeRate].self, resourceName: "rates")) ?? []

    
    return rates
}

func loadPropertyList<T: Codable>(type: T.Type, resourceName: String) throws -> T? {
      
    guard let url = Bundle.main.url(forResource: resourceName, withExtension: "plist")
        else{ throw URLError.cannotLoadURL }
        let data = try Data(contentsOf: url)
        let items = try PropertyListDecoder().decode(type, from: data)
        return items
}
