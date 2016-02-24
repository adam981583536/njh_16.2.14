//
//  MainViewController.m
//  项目三
//
//  Created by 汇文教育 on 16/1/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "MainViewController.h"
#import "TabBarControl.h"
#import "BaseNavigationController.h"
@interface MainViewController ()
{
    UIImageView *_tableView;
    
    UIImageView *_selectView;
    NSMutableArray *_navArr;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _creatTabBarView];
    [self _creatSubVC];
}

- (void)_creatTabBarView{
    
    
    _tableView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
    
    _tableView.image = [UIImage imageNamed:@"Skins/cat/mask_navbar.png"];
    
    _tableView.userInteractionEnabled = YES;
    
    [self.view addSubview:_tableView];
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 49)];
    
    _selectView.image = [UIImage imageNamed:@"Skins/cat/home_bottom_tab_arrow.png"];
    
    [_tableView addSubview:_selectView];
    
    NSArray *imgNames = @[@"BreadTrip/trip_like_button_image~ipad.png",
                          @"CarFilesOutput/car_images_FISWL/tabbar_hunter_button_image_hl@2x.png",
                          @"Skins/cat/home_tab_icon_3.png",
                          @"Skins/cat/home_tab_icon_4.png",
                          @"BreadTrip/tabbar_login_button_image~ipad.png"];
    
   // CGFloat itemWidth = kScreenWidth/5.0;
    
    NSArray *titleArray = @[@"推荐", @"城市猎人", @"",@"目的地", @"我的"];

    
    for (int i = 0 ; i < imgNames.count; i++) {
        NSString *name = imgNames[i];
        
        NSString *title = titleArray[i];
        CGFloat width = kScreenWidth/5;
        CGFloat height = CGRectGetHeight(_tableView.frame);
        
        TabBarControl *item = [[TabBarControl alloc] initWithFrame:CGRectMake(i *width, 0, width, height) withImage:name withTitle:title];//初始化的时候就传入这些东西
        item.tag = 100 + i;
        [item addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tableView addSubview:item];
        
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
    
    [self.view insertSubview:firstVC.view belowSubview:_tableView];
    
}


- (void)setSelectIndex:(NSInteger)selectIndex{
    //刚开始的时候我这个不调用是因为在选择我在切换页面的时候没有使用这个方法
    if (_selectIndex != selectIndex) {
        UIViewController *lastVC = self.childViewControllers[_selectIndex];
        
        UIViewController *currentVC = self.childViewControllers[selectIndex];
        
        
        [lastVC.view removeFromSuperview];
        
        [self.view insertSubview:currentVC.view belowSubview:_tableView];
        
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
