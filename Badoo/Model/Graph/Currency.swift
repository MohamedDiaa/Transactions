//
//  Currency.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-11.
//

import Foundation

typealias Currency = String

struct Rate {
    
    let source: Currency
    let destination: Currency
    let value: Double
}
