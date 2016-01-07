//
//  ProtocolClient.m
//  BlockOC
//
//  Created by Gaurav Sharma on 06/01/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import "ProtocolClient.h"
#import "BlockClient.h"

@implementation ProtocolClient

#pragma mark - Public Method

- (void)protocolTestSuccess:(UIViewController<ProtocolTest>*)vc {
    srand((unsigned)([NSDate date].timeIntervalSince1970));
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(rand()%5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self callProtocolMethod:vc];
    //    });
}

- (void)callProtocolMethod:(UIViewController<ProtocolTest>*)vc {
    pr(@"s %@", vc);
    if (rand()%2 == 0) {
        [vc successMethod];
    } else {
        [vc failureMethod];
    }
}

@end
