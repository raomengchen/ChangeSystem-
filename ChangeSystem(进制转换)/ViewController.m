//
//  ViewController.m
//  ChangeSystem(进制转换)
//
//  Created by RaoMeng on 2017/12/25.
//  Copyright © 2017年 TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *binary = [self getBinaryByDecimal:10110010];
    NSLog(@"%@",binary);
    
    NSUInteger number = [self getDecimalByBinary:@"1010"];
    NSLog(@"%ld",number);
    
    
}


/**
 十进制转成二进制

 @param decimal <#decimal description#>
 @return <#return value description#>
 */
- (NSString *)getBinaryByDecimal:(NSInteger)decimal {
   
    NSUInteger number = 32;
    (sizeof(void*) == 8) ? (number = 64) : (number = 32); // 判断系统的位数
    NSString *binary = @""; // 声明一个二级进制数
    NSUInteger tempDecimal = (NSInteger)labs(decimal);// 转成绝对值
    // 大于0
    while (tempDecimal) {
        binary = [[NSString stringWithFormat:@"%ld",tempDecimal % 2] stringByAppendingString:binary];
        if (tempDecimal / 2 < 1) {
            break; //退出循环
        }
        tempDecimal = tempDecimal / 2;
    }
    NSUInteger residueNumber = number - binary.length;
    NSMutableString *mStr = [NSMutableString new];
    for (int i = 0; i < residueNumber; i++) {
        [mStr appendString:@"0"];
    }
    binary = [mStr stringByAppendingString:binary];

    if (decimal < 0) {
//        NSString *oppssite = binary ;
        // 先求正数的反码在求补码
    }
    return binary;
}


/**
 二进制转10进制   没有考虑比较大的数（longlong放不下）

 @param binary <#binary description#>
 @return <#return value description#>
 */
- (NSUInteger)getDecimalByBinary:(NSString *)binary {
    
    if ([self isBlankString:binary]) {
        return 0;
    }
    NSUInteger result = 0;
    NSUInteger intexNumber = 0;
    NSUInteger index = binary.length;
    for (NSUInteger i = 0; i < index; i++) {
        intexNumber = [[binary substringWithRange:NSMakeRange(i,1)] integerValue];
        intexNumber = intexNumber * powf(2, index - i - 1); // 求几次方的方法
        result += intexNumber;
    }
    return result;
}



- (BOOL)isBlankString:(NSString *)str {
    
    if ((str == nil) || (str = NULL) || [str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"] ) {
        return YES;
    }
    return NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
