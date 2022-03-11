//
//  ExchangeList.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-11.
//

import Foundation

class ExchangeList{
    
    var adjacencies: [Currency: [Rate]] = [:]
    
    func createCurrency(_ name: String) {
        
        let currency = name
        adjacencies[currency] = []
    }
    
    func addRate(from source: Currency, to destination: Currency, value: Double) {
        
        let rate = Rate(source: source, destination: destination, value: value)
        adjacencies[source]?.append(rate)
    }
    
    func rates(from source: Currency) -> [Rate]? {
        
        return adjacencies[source]
    }
    
    func value(from source: Currency, to destination: Currency) -> Double? {
        
        return adjacencies[source]?.first{ $0.destination == destination }?.value
    }
    
    // MARK: - Exchange
    
    func exchange(from source: Currency, to destination: Currency) -> Double? {
        
        typealias CurrencyAccumlated = (currency: Currency, rateValue: Double)
        
        let queue: QueueArray<CurrencyAccumlated> = QueueArray<CurrencyAccumlated>()
        var dequeud: Set<Currency> = []
        
        queue.enqueue((currency: source,rateValue: 0.0))
        
        while !queue.isEmpty {
            
            let current = queue.dequeue()!
            
            if current.currency == destination {
                
                let value = current.rateValue
                let rate = Rate(source: source, destination: destination, value: value)
                adjacencies[source]?.append(rate)
                return value
            }
            
            dequeud.insert(current.currency)
            
            let rates = adjacencies[current.currency] ?? []
            for rate in rates {
                if !dequeud.contains(rate.destination) {
                    queue.enqueue((rate.destination, rate.value * current.rateValue))
                }
            }
        }
        
        return nil
    }
}
