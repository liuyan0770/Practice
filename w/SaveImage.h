//
//  SaveImage.h
//  w
//
//  Created by TX-LY on 12-11-2.
//  Copyright (c) 2012年 TX-LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveImage : NSObject
+ (UIImage*)LoadImageFromUrl:(NSURL*)url;
+ (void)SaveImageToLocal:(UIImage*)image Keys:(NSString*)key;
+ (BOOL)LocalHaveImage:(NSString*)key;
+ (UIImage*)GetImageFromLocal:(NSString*)key;
+ (void)SaveImageToPhotoAlbum:(UIImage *)image;

@end
