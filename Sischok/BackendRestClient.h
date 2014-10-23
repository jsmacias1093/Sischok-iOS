//
//  BackendRestClient.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 22/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <Foundation/Foundation.h>


@interface BackendRestClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
