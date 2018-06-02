//
//  VLOCVM.h
//  VLOCScript
//
//  Created by fatboyli on 2017/5/17.
//  Copyright © 2017年 fatboyli. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface VLOCVM : NSObject

+ (instancetype)shareInstance;
- (id)evalCode:(NSArray *)code withInitEnvVar:(NSDictionary *)dict;
- (id)evalCode:(NSArray *)code withInitEnvVar:(NSDictionary *)dict withReadDict:(NSMutableDictionary *)dict;



//设置环境变量
- (void)setVLOCENV:(id)val  forKey:(NSString *)key;
- (id)getVLOCENV:(NSString *)key;

- (void)setVLOCUserDefault:(id)val  forKey:(NSString *)key;
- (id)getVLOCUserDefault:(NSString *)key;


- (void)setVLOCValue:(id)value forKey:(NSString *)key;
- (id)getVLOCValue:(NSString *)key;
@end
