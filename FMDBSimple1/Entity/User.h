//
//  User.h
//  FMDBSimple1
//
//  Created by Benster on 15/2/7.
//  Copyright (c) 2015年 Workspaces. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, strong) NSString *userName;

@property (nonatomic, assign) NSInteger userAge;

@property (nonatomic, strong) NSString *address;

@property (nonatomic, strong) NSDictionary *dict;

- (NSDictionary *)dictionaryWithValuesAndKeys;

@end
