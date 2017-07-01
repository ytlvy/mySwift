//
//  YLPNeonViewAttribute.m
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonViewAttribute.h"
#import "YLPNeonCoordinates.h"

@interface YLPNeonViewAttribute ()

@end

@implementation YLPNeonViewAttribute

- (instancetype)initWithRelativeView:(UIView *)relativeView {
    self = [super init];
    if (self) {
        self.relativeView = relativeView;
        _scale = 1.0f;
    }
    return self;
}

- (void)setAlignType:(YLPNeonConstraintAlignType)alignType {
    _alignType  = alignType;
}

- (void)setEdgeCornerType:(YLPNeonConstraintEdgeCornerType)edgeCornerType {
    _edgeCornerType = edgeCornerType;
}

- (void)setXOffset:(CGFloat)xOffset {
    _xOffset = xOffset;
}

- (void)setYOffset:(CGFloat)yOffset {
    _yOffset = yOffset;
}

- (void)setWidth:(CGFloat)width {
    _width = width;
}

- (void)setHeight:(CGFloat)height {
    _height = height;
}

- (CGFloat)scale {
    if (_scale <= 0.0f) _scale = 1.0f;
    return _scale;
}

- (CGRect)frame {
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    if (_constraintType == YLPNeonConstraintType_Align) {
        if (_alignType == YLPNeonConstraintAlignType_Above) {
            x = self.relativeView.frame.origin.x + _xOffset;
            y = self.relativeView.frame.origin.y - _yOffset - _height;
        } else if (_alignType == YLPNeonConstraintAlignType_Under) {
            x = self.relativeView.frame.origin.x + _xOffset;
            y = self.relativeView.frame.origin.y + self.relativeView.frame.size.height + _yOffset;
        } else if (_alignType == YLPNeonConstraintAlignType_Left) {
            x = self.relativeView.frame.origin.x - _xOffset - _width;
            y = self.relativeView.frame.origin.y + _yOffset;
        } else if (_alignType == YLPNeonConstraintAlignType_Right) {
            x = self.relativeView.frame.origin.x + self.relativeView.frame.size.width + _xOffset;
            y = self.relativeView.frame.origin.y + _yOffset;
        }
    } else if (_constraintType == YLPNeonConstraintType_EdgeCorner) {
        if (_edgeCornerType == YLPNeonConstraintEdgeCornerType_TopLeft) {
            x = _xOffset;
            y = _yOffset;
        } else if (_edgeCornerType == YLPNeonConstraintEdgeCornerType_TopRight) {
            x = _superViewSize.width - _width - _xOffset;
            y = _yOffset;
        } else if (_edgeCornerType == YLPNeonConstraintEdgeCornerType_BottomLeft) {
            x = _xOffset;
            y = _superViewSize.height - _height - _yOffset;
        } else if (_edgeCornerType == YLPNeonConstraintEdgeCornerType_BottomRight) {
            x = _superViewSize.width - _width - _xOffset;
            y = _superViewSize.height - _height - _yOffset;
        }
    }
    return [YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(x, y, _width, _height) scale:self.scale];
}

@end
