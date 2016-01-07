//
//  ProtocolViewController.m
//  BlockOC
//
//  Created by Gaurav Sharma on 06/01/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import "ProtocolViewController.h"


@implementation ProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnProtocolTest:nil];
}

- (IBAction)btnProtocolTest:(id)sender {
    
    [[ProtocolClient new] protocolTestSuccess:self];
    
    [[ProtocolClient new] protocolTestSuccess:self];
    
    [[ProtocolClient new] protocolTestSuccess:self];
    
    [[ProtocolClient new] protocolTestSuccess:self];
}

- (IBAction)hit100:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 10000; i++) {
            [self btnProtocolTest:nil];
        }
    });
}

- (NSString *)successMethod {
    return @"success method implemented";
}

- (NSString *)failureMethod {
    return  @"failure method implemented";
}

@end
