//
//  ViewController.m
//  KIPOIAPTest_ObjectiveC
//
//  Created by Omid Golparvar on 6/30/18.
//  Copyright © 2018 Omid Golparvar. All rights reserved.
//

#import "ViewController.h"
#import "KIPOIAPKit/KIPOIAPKit-Swift.h"

@interface ViewController ()

@end

@interface ViewController () <KipoIAPDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (IBAction)actionTest:(UIButton *)sender {
	NSLog(@"Starting Test...");
	
}


@end


