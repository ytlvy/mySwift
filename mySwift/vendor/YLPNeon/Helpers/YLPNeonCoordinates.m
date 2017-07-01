//
//  YLPNeonCoordinates.m
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonCoordinates.h"

static CGFloat p_roundFloatToDisplayScale(CGFloat point, CGFloat scale) {
    CGFloat tempPoint = (CGFloat)(roundf((CGFloat)(point * scale)) / scale);
    if (tempPoint < 0.0f) tempPoint = 0.0f;
    return tempPoint;
}

static CGFloat p_ceilFloatToDisplayScale(CGFloat point, CGFloat scale) {
    CGFloat tempPoint = (CGFloat)(ceilf((CGFloat)(point * scale)) / scale);
    if (tempPoint < 0.0f) tempPoint = 0.0f;
    return tempPoint;
}

@implementation YLPNeonCoordinates

+ (CGRect)ylp_adjustRectToDisplayScale:(CGRect)rect scale:(CGFloat)scale {
    return CGRectMake(p_roundFloatToDisplayScale(rect.origin.x, scale),
                      p_roundFloatToDisplayScale(rect.origin.y, scale),
                      p_ceilFloatToDisplayScale(rect.size.width, scale),
                      p_ceilFloatToDisplayScale(rect.size.height, scale));
}

+ (CGFloat)ylp_roundFloatToDisplayScale:(CGFloat)point scale:(CGFloat)scale {
    return p_roundFloatToDisplayScale(point, scale);
}

+ (CGFloat)ylp_ceilFloatToDisplayScale:(CGFloat)point scale:(CGFloat)scale {
    return p_ceilFloatToDisplayScale(point, scale);
}

@end
