//
//  ViewController.m
//  TouchDemo
//
//  Created by qidi on 15/12/10.
//  Copyright © 2015年 张世琦. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UIImageView *bgImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.bgImg];
    //注册
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    
}

-(UIImageView *)bgImg{
    if (!_bgImg) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        img.image = [UIImage imageNamed:@"img_1.jpeg"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
        label.text = @"点击触发 3D Touch 效果";
        label.textColor = [UIColor blackColor];
        [img addSubview:label];
        self.bgImg = img;
    }
    return _bgImg;
}

#pragma mark -
#pragma mark UIViewControllerPreviewingDelegate

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    FirstViewController *first = [[FirstViewController alloc] init];
    first.preferredContentSize = CGSizeMake(0, 500);
    return first;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    FirstViewController *first = [[FirstViewController alloc] init];
    [self presentViewController:first animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
