//
//  GuideTableViewController.m
//  ECPA
//
//  Created by 花生 on 15/9/15.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import "GuideTableViewController.h"
#import "MyUtils.h"
#import "ListTableViewCell.h"
#import "RefreshTableView.h"
#import "PullRefreshView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define VIEW_BACKGROUND_COLOR [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0]
#define TABLEVIEW_BACKGROUND_COLOR [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0]
#define CELL_HIGHLIGHT_COLOR [UIColor colorWithRed:238.0/255.0f green:238.0/255.0f blue:238.0/255.0f alpha:1.0]
#define CELL_UNHIGHLIGHT_COLOR [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0]

@interface GuideTableViewController ()<PullRefreshViewDelegate>
@property (strong, nonatomic) IBOutlet RefreshTableView *tableView;

@property (nonatomic,strong) NSMutableArray *articleArr;
@end

@implementation GuideTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 初始化
    self.articleArr=[NSMutableArray array];
    
    // 修改返回按钮样式
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0,0,9,19);
    [backBtn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem=item;
    
    self.view.backgroundColor=VIEW_BACKGROUND_COLOR;
    
    float navigationBarHeight=self.navigationController.navigationBar.frame.size.height;
    self.tableView=[[RefreshTableView alloc]initWithFrame:CGRectMake(0, navigationBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-navigationBarHeight) style:UITableViewStylePlain isPullDownValid:YES isPullUpValid:YES];
    [self.tableView setBackgroundColor:TABLEVIEW_BACKGROUND_COLOR];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UINib *listNib=[UINib nibWithNibName:@"ListTableViewCell" bundle:nil];
    [self.tableView registerNib:listNib forCellReuseIdentifier:@"ListCell"];
    
    // 获取文章列表
    [self getArticleList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回主界面
- (void)goBack{
    [self.tableView.pullDonwView finishDataHandle];
    [self.tableView.pullUpView finishDataHandle];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//获取文章列表
- (void)getArticleList{
    [MyUtils getGuideAndCallback:^(id obj) {
        self.articleArr= [NSMutableArray arrayWithArray:obj];
        [self.tableView reloadData];
    }];
}

-(void)loadData{
    NSLog(@"%@",@"UP");
    [self.tableView pullDownFinish];
}

-(void)addData{
    NSLog(@"%@",@"Down");
    [self.tableView pullUpFinish];
}

#pragma mark - PullRefreshViewDelegate
- (void)didBeginLoadData:(PullRefreshView*)pullRefreshView{
    if (pullRefreshView.pullType==PullType_Header){
        [self loadData];
    }
    if (pullRefreshView.pullType==PullType_Footer){
        [self addData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *guideCell = [self.tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    NSDictionary *tempDic=self.articleArr[indexPath.row];
    guideCell.articleTitle=[tempDic objectForKey:@"title"];
    guideCell.articleDate=[tempDic objectForKey:@"date"];
    return guideCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *tempDic=self.articleArr[indexPath.row];
    NSString *tempTitle=[tempDic objectForKey:@"title"];
    NSString *tempDate=[tempDic objectForKey:@"date"];
    float compWidth=SCREEN_WIDTH-2*SIDE_MARGIN;
    //获得文字的高度
    float titleTextHeight=[MyUtils getTextHeightWithText:tempTitle andWidth:compWidth andFontSize:TITLE_FONT_SIZE];
    float dateTextHeight=[MyUtils getTextHeightWithText:tempDate andWidth:compWidth andFontSize:DATE_FONT_SIZE];
    float result=TOP_MARGIN*2+titleTextHeight+LABEL_SAPERAT+dateTextHeight;
    return result;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
