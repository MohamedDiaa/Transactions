//
//  Rate.h
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//


typedef enum {
    White = 1,
    Gray,
    Black
} VertexState;


#import <Foundation/Foundation.h>

@interface Rate : NSObject

@property(nonatomic,retain)NSString* to;
@property(nonatomic,retain)NSString* from;
@property(nonatomic,assign)double rate;

- (instancetype)initFromCurrency:(NSString*)from to:(NSString*)to rate:(double)rate;
-(Rate*)oppositeRate;

@end
