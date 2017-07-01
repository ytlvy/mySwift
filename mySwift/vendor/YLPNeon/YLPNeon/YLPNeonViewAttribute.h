//
//  YLPNeonViewAttribute.h
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonUtilities.h"

typedef NS_ENUM (NSInteger, YLPNeonConstraintType) {
    YLPNeonConstraintType_Align,
    YLPNeonConstraintType_EdgeCorner
};

typedef NS_ENUM (NSInteger, YLPNeonConstraintAlignType) {
    YLPNeonConstraintAlignType_Above,
    YLPNeonConstraintAlignType_Under,
    YLPNeonConstraintAlignType_Left,
    YLPNeonConstraintAlignType_Right
};

typedef NS_ENUM (NSInteger, YLPNeonConstraintEdgeCornerType) {
    YLPNeonConstraintEdgeCornerType_TopLeft,
    YLPNeonConstraintEdgeCornerType_TopRight,
    YLPNeonConstraintEdgeCornerType_BottomLeft,
    YLPNeonConstraintEdgeCornerType_BottomRight
};

@interface YLPNeonViewAttribute : NSObject

@property (nonatomic, weak) UIView *relativeView;

@property (nonatomic, assign) YLPNeonConstraintType constraintType;
@property (nonatomic, assign) YLPNeonConstraintAlignType alignType;
@property (nonatomic, assign) YLPNeonConstraintEdgeCornerType  edgeCornerType;

@property (nonatomic, assign) CGSize superViewSize;

@property (nonatomic, assign) CGFloat xOffset;
@property (nonatomic, assign) CGFloat yOffset;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat scale;

@property (nonatomic, assign, readonly) CGRect frame;

- (instancetype)initWithRelativeView:(UIView *)relativeView;

@end
