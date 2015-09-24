//
//  ListTableViewCell.h
//  ECPA
//
//  Created by 花生 on 15/9/22.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LABEL_SAPERAT 5
#define TITLE_FONT_SIZE 14
#define DATE_FONT_SIZE 12
#define TOP_MARGIN 15
#define SIDE_MARGIN 15

@interface ListTableViewCell : UITableViewCell
@property (nonatomic,copy) NSString *articleTitle;
@property (nonatomic,copy) NSString *articleDate;

@end
