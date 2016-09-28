//
//  Helper.m
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSString *)DocumentPathForFileName:(NSString *)fileName
{
    NSArray * pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * pathString = [pathArray objectAtIndex:0];
    NSString * filePath = [pathString   stringByAppendingPathComponent:fileName];
    
    return filePath;
}

@end
