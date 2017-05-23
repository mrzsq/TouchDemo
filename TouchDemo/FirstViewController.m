//
//  FirstViewController.m
//  TouchDemo
//
//  Created by qidi on 15/12/10.
//  Copyright © 2015年 张世琦. All rights reserved.
//

#import "FirstViewController.h"

#define  IOS8_LATER [[UIDevice currentDevice].systemVersion floatValue] >= 8.0

@interface FirstViewController ()

@property (nonatomic, strong) UIImageView *bgImg;
@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.bgImg];
    [self.view addGestureRecognizer:self.tap];
    
}

//背景图片

-(UIImageView *)bgImg{
    if (!_bgImg) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        img.image = [UIImage imageNamed:@"img_2.jpeg"];
        self.bgImg = img;
    }
    return _bgImg;
}

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    NSMutableArray *actArr = [[NSMutableArray alloc] init];
    UIPreviewAction *act1 = [UIPreviewAction actionWithTitle:@"选项一" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"-------选项一-------");
    }];
    UIPreviewAction *act2 = [UIPreviewAction actionWithTitle:@"选项二" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"-------选项二-------");
    }];
    UIPreviewAction *act3 = [UIPreviewAction actionWithTitle:@"选项三" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"-------选项三-------");
    }];
    [actArr addObject:act1];
    [actArr addObject:act2];
    [actArr addObject:act3];
    return actArr;
}


//点击手势

-(UITapGestureRecognizer *)tap{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    }
    return _tap;
}

- (void)tapAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
