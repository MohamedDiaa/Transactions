//
//  ListViewController.m
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import "ListViewController.h"
@interface ListViewController ()

@end

@implementation ListViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title data:(NSDictionary *)dataDic action:(void (^)(Transaction* t))action
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if (self)
    {
        // Custom stuff
        self.title = title;
        self.dataDic = dataDic;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Delegate and DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.dataDic != nil){
        return  self.dataDic.allKeys.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cellIdentifier" ;
    UITableViewCell * rowCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (rowCell == nil)
    {
        rowCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
    if(self.dataDic != nil && self.dataDic.count > indexPath.row){
        NSString* key = self.dataDic.allKeys[indexPath.row];
        rowCell.textLabel.text = key;
        NSArray* dataArray = self.dataDic[key];
        rowCell.detailTextLabel.text = [NSString stringWithFormat:@"%d transactions",dataArray.count];
    }
    return rowCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
