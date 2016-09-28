//
//  ListViewController.h
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "Transaction.h"

@interface ListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

//@property(nonatomic,retain)NSArray* dataArray;
@property(nonatomic,retain)NSDictionary* dataDic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title data:(NSDictionary *)dataDic action:(void (^)(Transaction* t))action;

@end
