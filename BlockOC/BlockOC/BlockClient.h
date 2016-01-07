//
//  BlockClient.h
//  BlockOC
//
//  Created by Gaurav Sharma on 06/01/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define pr(nsString,args...) NSLog(nsString,args);
#define po(object) NSLog(@"%@",object);

typedef NSString* (^SuccessBlock)();
typedef NSString* (^FailureBlock)();


@interface BlockClient : NSObject

+ (BlockClient*)sharedInstance;

- (void)blockTestSuccess:(SuccessBlock)successBlock
              andFailure:(FailureBlock)failureBlock;

@end
