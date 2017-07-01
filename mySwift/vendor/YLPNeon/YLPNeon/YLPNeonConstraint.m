//
//  YLPNeonConstraint.m
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonConstraint.h"

@implementation YLPNeonConstraint

#pragma mark - Public
- (YLPNeonConstraint * (^)(CGFloat))xOffset {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (YLPNeonConstraint * (^)(CGFloat))yOffset {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (YLPNeonConstraint * (^)(CGSize))size {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (YLPNeonConstraint * (^)(CGFloat))width {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (YLPNeonConstraint * (^)(CGFloat))height {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (YLPNeonConstraint * (^)(CGSize))superViewSize {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (YLPNeonConstraint * (^)(CGFloat))scale {
    YLPNeon_MethodNotImplemented();
    return nil;
}

- (CGRect (^)())install {
    return ^CGRect{
        return self.viewAttribute.frame;
    };
}

@end

@implementation YLPNeonViewConstraint

- (instancetype)initWithType:(YLPNeonConstraintType)type {
    self = [super init];
    if (self) {
        self.viewAttribute = [[YLPNeonViewAttribute alloc] init];
        self.viewAttribute.constraintType = type;
    }
    return self;
}

- (YLPNeonViewConstraint * (^)(UIView *))relativeView {
    return ^id(UIView *view) {
        self.viewAttribute.relativeView = view;
        return self;
    };
}

- (YLPNeonViewConstraint *(^)(YLPNeonConstraintAlignType))alignType {
    return ^id(YLPNeonConstraintAlignType alignType) {
        self.viewAttribute.alignType = alignType;
        return self;
    };
}

- (YLPNeonViewConstraint * (^)(YLPNeonConstraintEdgeCornerType))edgeCornerType {
    return ^id(YLPNeonConstraintEdgeCornerType edgeCornerType) {
        self.viewAttribute.edgeCornerType = edgeCornerType;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGFloat))xOffset {
    return ^id(CGFloat xOffset) {
        self.viewAttribute.xOffset = xOffset;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGFloat))yOffset {
    return ^id(CGFloat yOffset) {
        self.viewAttribute.yOffset = yOffset;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGSize))size {
    return ^id(CGSize size) {
        self.viewAttribute.width  = size.width;
        self.viewAttribute.height = size.height;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGFloat))width {
    return ^id(CGFloat width) {
        self.viewAttribute.width  = width;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGFloat))height {
    return ^id(CGFloat height) {
        self.viewAttribute.height = height;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGSize))superViewSize {
    return ^id(CGSize superViewSize) {
        self.viewAttribute.superViewSize  = superViewSize;
        return self;
    };
}

- (YLPNeonConstraint * (^)(CGFloat))scale {
    return ^id(CGFloat scale) {
        self.viewAttribute.scale = scale;
        return self;
    };
}

@end
