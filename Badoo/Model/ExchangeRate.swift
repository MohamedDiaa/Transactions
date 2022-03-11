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

struct RateNode {

    let currency: String
    let edges: [RateEdge]
}
struct RateEdge{
    
}

func getNodes(rates: [ExchangeRate])-> [String] {

   let result = rates.map { rate in
        
        [rate.to, rate.from]
   }.reduce([], +)
    
    let uniques = Array(Set(result))
    
    print("nodes")
    print(uniques)

    return uniques
}

/*
 extension Array where Element: Equatable {
     func removingDuplicates() -> Array {
         return reduce(into: []) { result, element in
             if !result.contains(element) {
                 result.append(element)
             }
         }
     }
 }
*/

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
