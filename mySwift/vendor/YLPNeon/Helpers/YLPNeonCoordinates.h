//
//  YLPNeonCoordinates.h
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLPNeonCoordinates : NSObject

+ (CGRect)ylp_adjustRectToDisplayScale:(CGRect)rect scale:(CGFloat)scale;

+ (CGFloat)ylp_roundFloatToDisplayScale:(CGFloat)point scale:(CGFloat)scale;

+ (CGFloat)ylp_ceilFloatToDisplayScale:(CGFloat)point scale:(CGFloat)scale;

@end
