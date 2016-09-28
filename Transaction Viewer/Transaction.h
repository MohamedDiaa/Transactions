//
//  Transaction.h
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property(nonatomic,assign)double amount;
@property(nonatomic,retain)NSString * currency;
@property(nonatomic,retain)NSString * sku;

+(NSArray*)LoadTransaction;
@end
