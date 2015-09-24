//
//  MyUtils.m
//  ECPA
//
//  Created by 花生 on 15/9/9.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import "MyUtils.h"
#import <UIKit/UIKit.h>

@implementation MyUtils

+(void)getMenusAndCallback:(Callback)callback{
    NSDictionary *menu1=@{@"menuName":@"信用查询",@"imageName":@"menuCreditSearch",@"seg":@"SearchSeg"};
    NSDictionary *menu2=@{@"menuName":@"信用体系",@"imageName":@"menuCreditSystem",@"seg":@"SystemSeg"};
    NSDictionary *menu3=@{@"menuName":@"信用研究",@"imageName":@"menuCreditStudy",@"seg":@"StudySeg"};
    NSDictionary *menu4=@{@"menuName":@"办事指南",@"imageName":@"menuCreditGuide",@"seg":@"GuideSeg"};
    NSDictionary *menu5=@{@"menuName":@"新闻政策",@"imageName":@"menuCreditNews",@"seg":@"NewsSeg"};
    NSDictionary *menu6=@{@"menuName":@"协会简介",@"imageName":@"menuCreditIntro",@"seg":@"IntroSeg"};
    NSDictionary *menu7=@{@"menuName":@"系统信息",@"imageName":@"menuSystemConfig",@"seg":@"ConfigSeg"};
    NSArray *menuArray=@[menu1,menu2,menu3,menu4,menu5,menu6,menu7];
    callback(menuArray);
}

+(void)getGuideAndCallback:(Callback)callback{
    NSDictionary *a1=@{@"title":@"信用保险及贸易融资资金补贴申请流程",@"date":@"2012-09-10"};
    NSDictionary *a2=@{@"title":@"小额贷款保证保险补贴申报",@"date":@"2012-09-12"};
    NSDictionary *a3=@{@"title":@"会员年审",@"date":@"2012-09-18"};
    NSDictionary *a4=@{@"title":@"信用保险及贸易融资资金补贴申请流程信用保险及贸易融资资金补贴申请流程",@"date":@"2012-09-20"};
    NSDictionary *a5=@{@"title":@"会员年审",@"date":@"2012-09-18"};
    NSDictionary *a6=@{@"title":@"会员年审",@"date":@"2012-09-18"};
    NSDictionary *a7=@{@"title":@"会员年审",@"date":@"2012-09-18"};
    NSDictionary *a8=@{@"title":@"信用保险及贸易融资资金补贴申请流程信用保险及贸易融资资金补贴申请流程",@"date":@"2012-09-20"};
    NSDictionary *a9=@{@"title":@"信用保险及贸易融资资金补贴申请流程信用保险及贸易融资资金补贴申请流程",@"date":@"2012-09-20"};
    NSDictionary *a10=@{@"title":@"信用保险及贸易融资资金补贴申请流程信用保险及贸易融资资金补贴申请流程",@"date":@"2012-09-20"};
    NSArray *newsArray=@[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10];
    callback(newsArray);
}

+(float)getTextHeightWithText:(NSString*)text andWidth:(float)width andFontSize:(int)fontSize{
    CGRect frame = [text boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    float height=frame.size.height;
    return height;
}

@end