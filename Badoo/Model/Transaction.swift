//
//  Transaction.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-07.
//

import SwiftUI

struct Transaction: Codable {
    
    let amount: String
    let currency: String
    let sku: String
    
}

struct Item {
    let sku: String
    let transactions: [Transaction]
}

struct Model {
    
    let transactions: [Transaction] = loadTransactions()
    
    func groupTransactions() -> [Item]{
        
        return Dictionary(grouping: transactions, by: \.sku)
            .map{ (key, transactions) in
                return Item(sku: key, transactions: transactions)
            }
    }
}

enum URLError: Error {
    case cannotLoadURL
}

func loadTransactions() -> [Transaction] {
    
    guard let t = try? loadPropertyList(type: [Transaction].self, resourceName: "transactions")
    else {return []}
    return t
}
