//
//  TransactionDetail.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-07.
//

import SwiftUI

struct TransactionDetail: View {
    
    let rates: [ExchangeRate] = []
    var item: Item
    
    var body: some View {
        
        VStack{
            
            ScrollView(.vertical) {
                
                ForEach(rates, id: \.rate){ rate in
                    
                    HStack {
                            
                        Text("\(rate.from) -> \(rate.to)")
                        Spacer()
                        Text("\(rate.rate)")
                    }
                }
            }
            
        }
    }
}

struct TransactionDetail_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetail(item: Item(sku: "0", transactions: []))
    }
}
