//
//  ViewController.m
//  BlockOC
//
//  Created by Gaurav Sharma on 06/01/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import "ViewController.h"
#import "BlockClient.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnBlockTest:nil];
}

- (IBAction)btnBlockTest:(id)sender {
    po(@"\n\n\n");
    SuccessBlock sb1, sb2;
    FailureBlock fb1, fb2;
    
    sb1 = ^NSString*() {
        pr(@"success %@, failure %@", sb1, fb1);
        return @"success 1";
    };
    
    fb1 = ^NSString*() {
        pr(@"success %@, failure %@", sb1, fb1);
        return @"failure 1";
    };
    
    sb2 = ^NSString*() {
        pr(@"success %@, failure %@", sb2, fb2);
        return @"success 2";
    };
    
    fb2 = ^NSString*() {
        pr(@"success %@, failure %@", sb2, fb2);
        return @"failure 2";
    };
    
    [[BlockClient new] blockTestSuccess:sb1 andFailure:fb1];
    
    [[BlockClient new] blockTestSuccess:sb2 andFailure:fb2];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        pr(@"\n5sec after \nsuccess1 %@, failure1 %@\nsuccess2 %@, failure2 %@", sb1, fb1, sb2, fb2);
    });
    
    
    [[BlockClient new] blockTestSuccess:^NSString *{
        po(@"block 3 success");
        return @"block 3 success return";
    } andFailure:^NSString *{
        po(@"block 3 failure");
        return @"block 3 failure return";
    }];
    
    
    [[BlockClient new] blockTestSuccess:^NSString *{
        po(@"block 4 success");
        return @"block 4 success return";
    } andFailure:^NSString *{
        po(@"block 4 failure");
        return @"block 4 failure return";
    }];
}

- (IBAction)hit100:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 10000; i++) {
            [self btnBlockTest:nil];
        }
    });
}

@end
