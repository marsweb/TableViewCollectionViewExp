//
//  GuideTableViewCell.h
//  ECPA
//
//  Created by 花生 on 15/9/15.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LABEL_SAPERAT 5
#define TITLE_FONT_SIZE 14
#define DATE_FONT_SIZE 12
#define TOP_MARGIN 15
#define SIDE_MARGIN 15

@interface GuideTableViewCell : UITableViewCell
@property (nonatomic,copy) NSString *articleTitle;
@property (nonatomic,copy) NSString *articleDate;

- (float)getCellHeight;
@end
