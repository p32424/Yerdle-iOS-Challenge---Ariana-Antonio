//
//  AuthorizationAPI.m
//  Yerdle iOS Challenge - Ariana Antonio
//
//  Created by Ariana Antonio on 8/15/15.
//  Copyright (c) 2015 Ariana Antonio. All rights reserved.
//

#import "AuthorizationAPI.h"
#import "TokenStore.h"

#define BASE_URL @"https://api.yerdl.es/v2/sessions"

@implementation AuthorizationAPI

//+ (id)sharedClient {
//    
//    static AuthorizationAPI *__instance;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSURL *baseUrl = [NSURL URLWithString:BASE_URL];
//        __instance = [[AuthorizationAPI alloc] initWithBaseURL:baseUrl];
//    });
//    return __instance;
//}
//
//- (id)initWithBaseURL:(NSURL *)url {
//    
//    self = [super initWithBaseURL:url];
//    if (self) {
//        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
//        [self setAuthTokenHeader];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(tokenChanged:)
//                                                     name:@"token-changed"
//                                                   object:nil];
//    }
//    return self;
//}
//
//- (void)setAuthTokenHeader {
//    TokenStore *store = [[TokenStore alloc] init];
//    NSString *authToken = [store authToken];
//    [self setDefaultHeader:@"auth_token" value:authToken];
//}
//
//- (void)tokenChanged:(NSNotification *)notification {
//    [self setAuthTokenHeader];
//}
@end
