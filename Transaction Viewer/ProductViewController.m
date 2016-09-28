//
//  ProductViewController.m
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title data:(NSArray *)dataArray
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if (self)
    {
        // Custom stuff
        self.title = title;
        self.dataArray = dataArray;
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
    if(self.dataArray != nil){
        return  self.dataArray.count;
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
    
    if(self.dataArray != nil && self.dataArray.count > indexPath.row){
        Transaction* t = _dataArray[indexPath.row];
        rowCell.textLabel.text = [NSString stringWithFormat:@"%.2f %@",t.amount,t.currency];
        rowCell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f %@",t.amount,t.currency];
    }
    return rowCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}



@end
