//
//  YLPNeonConstraint.h
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonUtilities.h"
#import "YLPNeonViewAttribute.h"

@interface YLPNeonConstraint : NSObject

@property (nonatomic, strong) YLPNeonViewAttribute *viewAttribute;

- (YLPNeonConstraint * (^)(CGFloat))xOffset;
- (YLPNeonConstraint * (^)(CGFloat))yOffset;
- (YLPNeonConstraint * (^)(CGSize))size;
- (YLPNeonConstraint * (^)(CGFloat))width;
- (YLPNeonConstraint * (^)(CGFloat))height;
- (YLPNeonConstraint * (^)(CGSize))superViewSize;
- (YLPNeonConstraint * (^)(CGFloat))scale;

- (CGRect (^)())install;

@end


@interface YLPNeonViewConstraint : YLPNeonConstraint

- (instancetype)initWithType:(YLPNeonConstraintType)type;

- (YLPNeonViewConstraint * (^)(UIView *))relativeView;
- (YLPNeonViewConstraint * (^)(YLPNeonConstraintAlignType))alignType;
- (YLPNeonViewConstraint * (^)(YLPNeonConstraintEdgeCornerType))edgeCornerType;

@end



