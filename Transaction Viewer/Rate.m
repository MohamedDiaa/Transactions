//
//  Rate.m
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import "Rate.h"

@implementation Rate

- (instancetype)initFromCurrency:(NSString*)from to:(NSString*)to rate:(double)rate
{
    self = [super init];
    if (self && from != nil && to != nil) {
        self.from = from;
        self.to = to;
        self.rate = rate;
    }
    return self;
}
+(NSDictionary*)LoadRates{
    
    //Returns Dictionry with Keys Currency and value is it's rate with GBP.
    NSString * ratesPath  = [[NSBundle mainBundle] pathForResource:@"rates.plist" ofType:nil];
    NSArray* ratesDic = [NSArray arrayWithContentsOfFile:ratesPath];

    if(ratesDic != nil && ratesDic.count != 0){
        
        NSMutableDictionary* ratesClusters = [[NSMutableDictionary alloc] init];


        for(int index = 0 ; index < ratesDic.count ; index++)
        {
            NSMutableDictionary * dic = ratesDic[index];
            NSString* from = dic[@"from"];
            NSNumber* rateValue = dic[@"rate"];
            NSString* to = dic[@"to"];
            
            
            if (from!= nil && rateValue != nil && to != nil){
                
                Rate* rate = [[Rate alloc] initFromCurrency:from to:to rate:rateValue.doubleValue];

                NSMutableArray* fromCluster = [ratesClusters objectForKey:from];
                if(fromCluster == nil){
                    NSMutableArray* fromCluster = [[NSMutableArray alloc] init];
                    [fromCluster addObject:rate];
                    [ratesClusters setObject:fromCluster forKey:from];
                }else{
                    [fromCluster addObject:rate];
                    [ratesClusters setObject:fromCluster forKey:from];
                }
            
            
            Rate* oppositeRate = [rate oppositeRate];
            
            NSMutableArray* toCluster = [ratesClusters objectForKey:to];
            if(toCluster == nil){
                NSMutableArray* toCluster = [[NSMutableArray alloc] init];
                [toCluster addObject:oppositeRate];
                [ratesClusters setObject:toCluster forKey:to];
            }else{
                [toCluster addObject:oppositeRate];
                [ratesClusters setObject:toCluster forKey:to];
                
                }
            }
        }
        
        return ratesClusters;
    }
    return nil;
}

-(Rate*)oppositeRate{
 
    Rate* r = [[Rate alloc] initFromCurrency:self.to to:self.from rate: (2-self.rate)+0.01];
    return r;
}

@end

