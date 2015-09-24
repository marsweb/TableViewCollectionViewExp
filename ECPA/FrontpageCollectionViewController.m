//
//  FrontpageCollectionViewController.m
//  ECPA
//
//  Created by 花生 on 15/9/15.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import "FrontpageCollectionViewController.h"
#import "MenuCollectionViewCell.h"
#import "MyUtils.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define VIEW_BACKGROUND_COLOR [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0]
#define COLLECTIONVIEW_BACKGROUND_COLOR [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0]
#define CELL_HIGHLIGHT_COLOR [UIColor colorWithRed:238.0/255.0f green:238.0/255.0f blue:238.0/255.0f alpha:1.0]
#define CELL_UNHIGHLIGHT_COLOR [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0]


@interface FrontpageCollectionViewController ()
@property (nonatomic,strong)NSArray *menuArr;

@end

@implementation FrontpageCollectionViewController

static NSString * const reuseIdentifier = @"MenuCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
    // 菜单的跳转信息数组
    self.menuArr=@[];
    
    // 修改样式
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBackground"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=VIEW_BACKGROUND_COLOR;
    [self.collectionView setBackgroundColor:COLLECTIONVIEW_BACKGROUND_COLOR];
    
    
    //获得菜单信息
    [self getMenuInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getMenuInfo{
    [MyUtils getMenusAndCallback:^(id obj) {
        self.menuArr=obj;
        [self.collectionView reloadData];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.menuArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuCollectionViewCell *menuCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    NSDictionary *tempDic=self.menuArr[indexPath.row];
    menuCell.menuImage=[UIImage imageNamed:[tempDic objectForKey:@"imageName"]];
    menuCell.menuName=[tempDic objectForKey:@"menuName"];
    
    return menuCell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *rsView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    return rsView;
}

#pragma mark <UICollectionViewDelegate>

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuCollectionViewCell *tempCell=(MenuCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [tempCell setBackgroundColor:CELL_HIGHLIGHT_COLOR];

}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuCollectionViewCell *tempCell=(MenuCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [tempCell setBackgroundColor:CELL_UNHIGHLIGHT_COLOR];
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *tempMenu=self.menuArr[indexPath.row];
    NSString *tempSegName=[tempMenu objectForKey:@"seg"];
    [self performSegueWithIdentifier:tempSegName sender:nil];
}

#pragma mark <UICollectionViewDelegateFlowLayout>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH/4);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT/3.5);
}

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
