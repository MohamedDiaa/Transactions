//
//  ViewController.m
//  Transaction Viewer
//
//  Created by MohamedDiaa on 9/28/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ListViewController * listController = [[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:listController];
    
    [self.view addSubview:self.navController.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
