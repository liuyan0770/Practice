//
//  SaveImageToLocalViewController.m
//  w
//
//  Created by TX-LY on 12-11-2.
//  Copyright (c) 2012年 TX-LY. All rights reserved.
//

#import "SaveImageToLocalViewController.h"
#import "SaveImage.h"

@interface SaveImageToLocalViewController ()
{
    NSURL *picUrl;
    UIImage *displayImage;
}

@end

@implementation SaveImageToLocalViewController

@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"Downloading…");
    // Get an image from the URL below
    
//    url = [NSURL URLWithString:@"http://cc.cocimg.com/bbs/attachment/upload/07/128707.png"];
    picUrl = [NSURL URLWithString:@"http://tp1.sinaimg.cn/2122519000/50/5620445947/1"];
    displayImage = [SaveImage LoadImageFromUrl:picUrl];
    NSLog(@"%f,%f",displayImage.size.width,displayImage.size.height);
    imageView.image = displayImage;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//单击图片保存图片到本地相册
- (IBAction)saveImageToLocal:(id)sender
{
    if ([SaveImage LocalHaveImage:[picUrl absoluteString]]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                              
                                                        message:@"该图片已经存在！"
                              
                                                       delegate:self
                              
                                              cancelButtonTitle:@"OK"
                              
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        [SaveImage SaveImageToLocal:displayImage Keys:[picUrl absoluteString]];
        UIImage *image = [SaveImage GetImageFromLocal:[picUrl absoluteString]];
        [SaveImage SaveImageToPhotoAlbum:image];
    }
    
}

//点击按钮保存图片到本地
- (IBAction)clickSaveImage:(id)sender
{
    if ([SaveImage LocalHaveImage:[picUrl absoluteString]]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                              
                                                        message:@"该图片已经存在！"
                              
                                                       delegate:self
                              
                                              cancelButtonTitle:@"OK"
                              
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        [SaveImage SaveImageToLocal:displayImage Keys:[picUrl absoluteString]];
        UIImage *image = [SaveImage GetImageFromLocal:[picUrl absoluteString]];
        [SaveImage SaveImageToPhotoAlbum:image];
    }
    
}

//从网上下载图片
- (UIImage*)loadImageFromUrl:(NSURL*)url
{
    NSData *picData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:picData];
    return image;
}

@end
