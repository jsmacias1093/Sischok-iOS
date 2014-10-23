//
//  BackendRestClient.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 22/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "BackendRestClient.h"

@implementation BackendRestClient

static NSString * const backendRestClientAPIBaseURLString = @"http://backend-sischok.herokuapp.com/";


+ (instancetype)sharedClient {
    static BackendRestClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BackendRestClient alloc] initWithBaseURL:[NSURL URLWithString:backendRestClientAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}


@end
