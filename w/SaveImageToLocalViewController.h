//
//  SaveImageToLocalViewController.h
//  w
//
//  Created by TX-LY on 12-11-2.
//  Copyright (c) 2012年 TX-LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveImageToLocalViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

//单击图片将图片保存到本地相册
- (IBAction)saveImageToLocal:(id)sender;
//点击按钮将图片保存到本地
- (IBAction)clickSaveImage:(id)sender;
@end
