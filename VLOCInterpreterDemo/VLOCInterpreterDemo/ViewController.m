//
//  ViewController.m
//  TestVLOCScript
//
//  Created by fatboyli on 17/5/27.
//  Copyright © 2017年 fatboyli. All rights reserved.
//

#import "ViewController.h"
#import <VLOCInterpreterFramework/VLOCInterpreterFramework.h>
#import "ViewControllerShareView.h"
#import <objc/runtime.h>
#import "TestCollectionView.h"

@interface testView : UIView

@end
@implementation testView


@end

@interface ViewController ()
@property(nonatomic ,strong)UIView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[ViewControllerShareView shareInstance] testOverrider];
    
    NSString *theStr = [[NSBundle mainBundle] pathForResource:@"mScriptFiles/source_common" ofType:@"m"];
    VLOCCompiler *interpreter = [[VLOCCompiler alloc] init];
    NSArray *codes =  [interpreter VLOC_TranslateWithFile:theStr];
//    NSData *data=[NSJSONSerialization dataWithJSONObject:codes options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",jsonStr);
//    NSLog(@"<===================EVAL VLOC 真机器 RES===========================>");
//    NSDate* Start = [NSDate date];
    id contentView=  [[VLOCVM shareInstance] evalCode:codes withInitEnvVar:@{@"baseView":self.view}];
//    double deltaTime = [[NSDate date] timeIntervalSinceDate:Start];
//    NSLog(@"＊＊＊＊＊＊cost time = %f", deltaTime);
    [self.view addSubview:contentView];
    self.contentView = contentView;
 
    
//    [[ViewControllerShareView shareInstance] testOverrider];
//    NSData *newdata = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"res/source_jspatch" ofType:@"js"]];
//
//    NSString *str = [[NSString alloc] initWithData:newdata encoding:NSUTF8StringEncoding];
//
//    Start = [NSDate date];
//
//    deltaTime = [[NSDate date] timeIntervalSinceDate:Start];
//    NSLog(@"＊＊＊＊＊＊cost time = %f", deltaTime);
//
}



- (void)readB:(double)b
{
    
}

- (void)onClick:(id)btn
{
    [self.contentView removeFromSuperview];
    self.contentView = nil;
}

- (void)onClickAdd:(id)btn
{
    //**
    NSString *theStr = [[NSBundle mainBundle] pathForResource:@"res/source_property_B" ofType:@"m"];
    VLOCCompiler *interpreter = [[VLOCCompiler alloc] init];
    NSArray *codes =  [interpreter VLOC_TranslateWithFile:theStr];
    NSLog(@"<===================EVAL RES===========================>");
    
    NSLog(@"%@",UICollectionElementKindSectionHeader);
    UIView *contentView = [[VLOCVM shareInstance] evalCode:codes withInitEnvVar:@{@"baseView":self.view}];
    
    [self.view addSubview:contentView];
    [contentView setFrame:self.view.bounds];
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.contentView = contentView;
    
   
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.contentView setFrame:self.view.bounds];
    [self.contentView setNeedsLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
