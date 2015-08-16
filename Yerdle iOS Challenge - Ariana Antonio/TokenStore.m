//
//  TokenStore.m
//  Yerdle iOS Challenge - Ariana Antonio
//
//  Created by Ariana Antonio on 8/15/15.
//  Copyright (c) 2015 Ariana Antonio. All rights reserved.
//

#import "TokenStore.h"
#import "SSKeychain.h"

#define SERVICE_NAME @"Yerdle-AuthClient"
#define AUTH_TOKEN_KEY @"auth_token"

@implementation TokenStore

//checking if logged in
- (BOOL)isLoggedIn {
    return [self authToken] != nil;
}

//on logout
- (void)clearSavedCredentials {
    [self setAuthToken:nil];
}

- (NSString *)authToken {
    return [self secureValueForKey:AUTH_TOKEN_KEY];
}

- (void)setAuthToken:(NSString *)authToken {
    [self setSecureValue:authToken forKey:AUTH_TOKEN_KEY];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"token-changed" object:self];
}

- (void)setSecureValue:(NSString *)value forKey:(NSString *)key {
    if (value) {
        [SSKeychain setPassword:value
                     forService:SERVICE_NAME
                        account:key];
    } else {
        [SSKeychain deletePasswordForService:SERVICE_NAME account:key];
    }
}

- (NSString *)secureValueForKey:(NSString *)key {
    return [SSKeychain passwordForService:SERVICE_NAME account:key];
}

@end
