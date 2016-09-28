//
//  Transaction.m
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import "Transaction.h"
#import "Helper.h"

@implementation Transaction

- (instancetype)initWithAmount:(double)amount currency:(NSString*)currency sku:(NSString* )sku
{
    self = [super init];
    if (self) {
        self.amount = amount;
        self.currency = currency;
        self.sku = sku;
    }
    return self;
}

+(NSDictionary*)LoadTransaction{
    
    NSString * transactionsPath  = [[NSBundle mainBundle] pathForResource:@"transactions.plist" ofType:nil];
    NSArray* transactionsDic = [NSArray arrayWithContentsOfFile:transactionsPath];
    if (transactionsDic!= nil){
        
    NSMutableDictionary* transactionsClusters = [[NSMutableDictionary alloc] init];

    for(int index = 0 ; index < transactionsDic.count ; index++)
    {
        NSMutableDictionary * dic = transactionsDic[index];
        NSNumber* amount = dic[@"amount"];
        NSString* currency = dic[@"currency"];
        NSString* sku = dic[@"sku"];
        if (amount!= nil && currency != nil && sku != nil){
           
            Transaction * t = [[Transaction alloc] initWithAmount:amount.doubleValue currency:currency sku:sku];
            //[transactions addObject:t];
            
            NSMutableArray* cluster = [transactionsClusters objectForKey:sku];
            if(cluster == nil){
                NSMutableArray* cluster = [[NSMutableArray alloc] init];
                [cluster addObject:t];
                [transactionsClusters setObject:cluster forKey:sku];
            }else{
                [cluster addObject:t];
                [transactionsClusters setObject:cluster forKey:sku];
            }
        }
    }
        
    return transactionsClusters;
    }
    return nil;
}


@end



