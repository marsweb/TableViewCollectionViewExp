//
//  MyUtils.h
//  ECPA
//
//  Created by 花生 on 15/9/9.
//  Copyright (c) 2015年 花生. All rights reserved.
//

typedef void(^Callback)(id obj);
#import <Foundation/Foundation.h>

@interface MyUtils : NSObject
//获得菜单信息
+(void)getMenusAndCallback:(Callback)callback;
//获得指南文章列表
+(void)getGuideAndCallback:(Callback)callback;
+(float)getTextHeightWithText:(NSString*)text andWidth:(float)width andFontSize:(int)fontSize;
@end
