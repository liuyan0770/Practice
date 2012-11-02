//
//  SaveImage.m
//  w
//
//  Created by TX-LY on 12-11-2.
//  Copyright (c) 2012年 TX-LY. All rights reserved.
//

#import "SaveImage.h"

@implementation SaveImage

//从网上下载图片
+ (UIImage*)LoadImageFromUrl:(NSURL*)url
{
    NSData *picData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:picData];
    return image;
}

//将图片保存到本地
+ (void)SaveImageToLocal:(UIImage*)image Keys:(NSString*)key
{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    [preferences setObject:UIImagePNGRepresentation(image) forKey:key];
}

//本地是否有相关图片
+ (BOOL)LocalHaveImage:(NSString*)key
{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    NSData* imageData = [preferences objectForKey:key];
    if (imageData) {
        return YES;
    }
    return NO;
}

//从本地获取图片
+ (UIImage*)GetImageFromLocal:(NSString*)key
{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    NSData* imageData = [preferences objectForKey:key];
    UIImage* image;
    if (imageData) {
        image = [UIImage imageWithData:imageData];
    }
    else {
        NSLog(@"未从本地获得图片");
    }
    return image;
}

+ (void)SaveImageToPhotoAlbum:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储照片成功"
                          
                                                    message:@"您已将照片存储于图片库中，打开照片程序即可查看。"
                          
                                                   delegate:self
                          
                                          cancelButtonTitle:@"OK"
                          
                                          otherButtonTitles:nil];
    
    [alert show];
}

@end
