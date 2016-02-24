//
//  BaseNavigationController.m
//  项目三
//
//  Created by 汇文教育 on 16/1/27.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    //self.tabBarController.tabBar.backgroundColor = [UIColor blackColor];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"CarFilesOutput/car_images_FISWL/root_tab_bg@2x.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
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
