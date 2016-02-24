//
//  RootTabBarController.m
//  项目三
//
//  Created by 汇文教育 on 16/1/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "RootTabBarController.h"
#import "TabBarControl.h"
#import "BaseNavigationController.h"
@interface RootTabBarController ()
{
   
    
    UIImageView *_selectView;
}
@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _creatTabBarView];
    self.tabBarController.tabBar.translucent = NO;
    
    [self _creatSubVC];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //移除系统tabbar自带的item
    [self removeUITabBarButton];
}
-(void)removeUITabBarButton
{
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

- (void)_creatTabBarView{
    CGFloat width = kScreenWidth/5;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);

    
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 49)];
    
    _selectView.image = [UIImage imageNamed:@"Skins/cat/home_bottom_tab_arrow.png"];
    [self.tabBar addSubview:_selectView];
    //self.tabBarController.tabBar.frame = CGRectMake(0,0, kScreenWidth, height + 100);
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"CarFilesOutput/car_images_FISWL/root_tab_bg@2x.png"];
    
   // self.tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BreadTrip/route_action_bar_bg@2x.png"]];
        
    self.tabBar.contentMode = UIViewContentModeScaleToFill;
    
    NSArray *imgNames = @[@"CarFilesOutput/car_images_FISWL/root_tab_recommand_hl@2x.png",
                          @"CarFilesOutput/car_images_FISWL/root_tab_play_hl@2x.png",
                          @"CarFilesOutput/car_images_FISWL/trip_edit_toolbar_add_photo_bg.png",
                          @"CarFilesOutput/car_images_FISWL/root_tab_dest_hl@2x.png",
                          @"CarFilesOutput/car_images_FISWL/root_tab_me_hl@2x.png"];
    
    // CGFloat itemWidth = kScreenWidth/5.0;
    
    NSArray *titleArray = @[@"推荐", @"城市猎人",@"",@"目的地", @"我的"];
    
    
    for (int i = 0 ; i < imgNames.count; i++) {
        
        NSString *name = imgNames[i];

        if (i == 2) {
            UIImageView *threeView = [[UIImageView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
            
            [threeView setImage:[UIImage imageNamed:name]];
            threeView.contentMode = UIViewContentModeScaleToFill;
            
            [self.tabBar addSubview:threeView];
            
            
            UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 3, width, height -3)];
            
            [addButton setImage:[UIImage imageNamed:                          @"CarFilesOutput/car_images_FISWL/root_tabbar_add_icon@2x.png"] forState:UIControlStateNormal];
    
            [self.tabBar addSubview:addButton];
            
        }else{
            
            NSString *title = titleArray[i];
            TabBarControl *item = [[TabBarControl alloc] initWithFrame:CGRectMake(i *width, 0, width, height ) withImage:name withTitle:title];//初始化的时候就传入这些东西
            item.tag = 100 + i;
            [item addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.tabBar addSubview:item];

        }
    }
    
    
    
    
}
- (void)_creatSubVC{
    NSArray *NameArr = @[@"Main",@"Hunter",@"Add",@"Destination",@"Account"];
    //  NSMutableArray *navArr = [[NSMutableArray alloc] init];
    
    for (NSString *name in NameArr) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:name bundle:nil];
        
        UINavigationController *nav = [story instantiateInitialViewController];
        
        [self addChildViewController:nav];
    }
    
    //    self.childViewControllers = navArr;
    UIViewController *firstVC = self.childViewControllers[0];
    
    [self.view insertSubview:firstVC.view belowSubview:self.tabBar];
    
}


- (void)setSelectIndex:(NSInteger)selectIndex{
    //刚开始的时候我这个不调用是因为在选择我在切换页面的时候没有使用这个方法
    if (_selectIndex != selectIndex) {
        UIViewController *lastVC = self.childViewControllers[_selectIndex];
        
        UIViewController *currentVC = self.childViewControllers[selectIndex];
        
        
        [lastVC.view removeFromSuperview];
        
        [self.view insertSubview:currentVC.view belowSubview:self.tabBar];
        
        _selectIndex = selectIndex;
    }
    
    
    
}
- (void)selectTab:(UIButton *)sender{
    self.selectIndex = sender.tag - 100;
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = sender.center;
    }];
    
    
}- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
