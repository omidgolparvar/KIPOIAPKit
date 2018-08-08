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
	[KipoIAP SetupWithDelegate: self];
	[KipoIAP PayWithAmount:10000];
}


- (void)kipoCannotPerformWithError:(enum KipoError)error {
	NSLog(@"%@", [KipoIAP ConvertErrorToString:error]);
}

- (void)kipoPaymentWithErrorMessage:(NSString * _Nonnull)errorMessage {
	NSLog(@"%@", errorMessage);
}

- (void)kipoPaymentWithPaymentToken:(NSString * _Nonnull)token {
	
}

@end


