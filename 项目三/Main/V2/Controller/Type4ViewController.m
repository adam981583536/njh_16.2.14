//
//  Type4ViewController.m
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "Type4ViewController.h"
#import "MainModel.h"
//#import "YYModel.h"
@interface Type4ViewController ()

@end

@implementation Type4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  NSLog(@"进到4了");
    [self _creatTableView];
}
- (void)_creatTableView{
    
    


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setType4Id:(NSNumber *)type4Id{

    
        _type4Id = type4Id;
      //  NSLog(@"%@",type4Id);
        [self _loadData:type4Id];

    

}
- (void)_loadData:(NSNumber *)num{
    _covered_countriesArr = [[NSMutableArray alloc] init];
    NSURLSessionConfiguration   *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *string = [NSString stringWithFormat:@"http://api.breadtrip.com/trips/%@/waypoints/",num];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *download = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        //NSLog(@"%@",response);
       // NSLog(@"%@",responseObject);
        MainModel *main = [[MainModel alloc] init];
        
        main.trackpoints_thumbnail_image = [responseObject objectForKey:@"trackpoints_thumbnail_image"];
       // NSLog(@"%@",main.trackpoints_thumbnail_image);
        
        
    }];
    [download resume];
    
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
