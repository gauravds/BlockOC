//
//  ProtocolClient.h
//  BlockOC
//
//  Created by Gaurav Sharma on 06/01/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ProtocolTest <NSObject>
- (NSString*)successMethod;
- (NSString*)failureMethod;
@end


@interface ProtocolClient : NSObject

- (void)protocolTestSuccess:(UIViewController<ProtocolTest>*)vc;

@end
