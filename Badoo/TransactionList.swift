//
//  TransactionList.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-07.
//

import SwiftUI

struct TransactionList: View {
    
    let transactions: [Item] = Model().groupTransactions()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScrollView(.vertical){
                    ForEach(transactions, id: \.sku) { item in
                        
                        NavigationLink(destination: TransactionDetail(item: item)) {
                            
                            VStack{
                                HStack{
                                    Text(item.sku)
                                    Spacer()
                                    Text("\(item.transactions.count)" + " transactions")
                                }
                                .padding()
                                
                                Divider()
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TransactionList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionList()
    }
}
