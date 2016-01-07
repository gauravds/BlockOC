//
//  BlockClient.m
//  BlockOC
//
//  Created by Gaurav Sharma on 06/01/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import "BlockClient.h"

@interface BlockClient ()
@end

@implementation BlockClient

#pragma mark - Public Method

+ (id)sharedInstance {
    static BlockClient *SINGLETON = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SINGLETON = [[self alloc] init];
    });
    return SINGLETON;
}

- (void)blockTestSuccess:(SuccessBlock)successBlock
              andFailure:(FailureBlock)failureBlock {
    srand((unsigned)([NSDate date].timeIntervalSince1970));
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(rand()%5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self callBlockSuccess:successBlock
                    andFailure:failureBlock];
//    });
}

- (void)callBlockSuccess:(SuccessBlock)successBlock
              andFailure:(FailureBlock)failureBlock {
    pr(@"s %@, f %@", successBlock, failureBlock);
    if (rand()%2 == 0) {
        po(successBlock());
    } else {
        po(failureBlock());
    }
}

@end
