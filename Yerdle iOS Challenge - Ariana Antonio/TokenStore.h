//
//  TokenStore.h
//  Yerdle iOS Challenge - Ariana Antonio
//
//  Created by Ariana Antonio on 8/15/15.
//  Copyright (c) 2015 Ariana Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TokenStore : NSObject

- (BOOL)isLoggedIn;
- (NSString *)authToken;
- (void)setAuthToken:(NSString *)authToken;

@end
