//
//  User.m
//  FMDBSimple1
//
//  Created by Benster on 15/2/7.
//  Copyright (c) 2015年 Workspaces. All rights reserved.
//

#import "User.h"
#import <objc/runtime.h>

@implementation User

//#pragma mark - 返回类中所有的属性名和值
//- (NSDictionary *)dictionaryWithValuesAndKeys
//{
//    NSMutableDictionary *keysAndValues = [[NSMutableDictionary alloc] init];
//    @autoreleasepool {
//        unsigned int outCount, i;
//        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
//        for (i = 0; i<outCount; i++)
//        {
//            objc_property_t property = properties[i];
//            const char* char_f =property_getName(property);
//            NSString *propertyName = [NSString stringWithUTF8String:char_f];
//            id propertyValue = [self valueForKey:propertyName];
//            NSString *attributes = [NSString stringWithUTF8String:property_getAttributes(property)];//获取属性类型
//            
//            if ([attributes hasPrefix:@"Tc"] && [propertyValue boolValue] == false)
//            {
//                propertyValue = [NSNumber numberWithBool:false];
//            } else if ([attributes hasPrefix:@"Tc"] && [propertyValue boolValue] == true) {
//                propertyValue = [NSNumber numberWithBool:true];
//            }
//            
//            if (propertyValue == nil ||
//                [propertyValue isKindOfClass:[NSNull class]] ||
//                ([attributes hasPrefix:@"T@\"NSString\""] && [[NSString stringWithFormat:@"%@", propertyValue] isEqualToString:@"(null)"]))
//            {
//                continue;
//            }
//            
//            [keysAndValues setValue:((propertyValue == nil) ? @"" : propertyValue) forKey:propertyName];
//        }
//    }
//    
//    return keysAndValues;
//}

- (NSDictionary *)dictionaryWithValuesAndKeys
{
    return [self dictionaryWithValuesForKeys:[self arrayWithKeys]];
}

- (NSArray *)arrayWithKeys
{
    NSMutableArray *allKeys = [[NSMutableArray alloc] init];
    @autoreleasepool {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (i = 0; i<outCount; i++)
        {
            objc_property_t property = properties[i];
            const char* char_f =property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            [allKeys addObject:propertyName];
        }
    }
    
    return allKeys;
}

@end
