//
//  VLOCCompiler.h
//  VLOCCompiler
//
//  Created by fatboyli on 2017/5/14.
//  Copyright © 2017年 fatboyli. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface VLOCCompiler : NSObject

- (NSArray *) VLOC_TranslateWithFile:(NSString *)filePath;
- (NSArray *) VLOC_TranslateWithString:(NSString *)str;
@end

