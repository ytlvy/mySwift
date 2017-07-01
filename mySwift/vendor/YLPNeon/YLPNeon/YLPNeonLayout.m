//
//  YLPNeonLayout.m
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonLayout.h"
#import "YLPNeonViewAttribute.h"

@interface YLPNeon ()

@property (nonatomic, weak)   YLPNeon_View *view;

@end

@implementation YLPNeon

- (instancetype)initWithView:(YLPNeon_View *)view {
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

#pragma mark - Public
- (void)installNeon {
    [self.view setFrame:self.constraint.install()];
}

@end

/////////////////////////////////////////////////////////////////////////////////////////

@implementation YLPNeonAlign

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    if (self) {
        self.constraint = [[YLPNeonViewConstraint alloc] initWithType:YLPNeonConstraintType_Align];
        self.constraint.superViewSize(view.superview.frame.size);
    }
    return self;
}

#pragma mark - Public
- (void)installNeon {
    [super installNeon];
}

- (YLPNeonConstraint * (^)(UIView *))above {
    return ^id(UIView *relativeView) {
        self.constraint = self.constraint.relativeView(relativeView);
        self.constraint.alignType(YLPNeonConstraintAlignType_Above);
        return self.constraint;
    };
}

- (YLPNeonConstraint * (^)(UIView *))under {
    return ^id(UIView *relativeView) {
        self.constraint = self.constraint.relativeView(relativeView);
        self.constraint.alignType(YLPNeonConstraintAlignType_Under);
        return self.constraint;
    };
}

- (YLPNeonConstraint * (^)(UIView *))left {
    return ^id(UIView *relativeView) {
        self.constraint = self.constraint.relativeView(relativeView);
        self.constraint.alignType(YLPNeonConstraintAlignType_Left);
        return self.constraint;
    };
}

- (YLPNeonConstraint * (^)(UIView *))right {
    return ^id(UIView *relativeView) {
        self.constraint = self.constraint.relativeView(relativeView);
        self.constraint.alignType(YLPNeonConstraintAlignType_Right);
        return self.constraint;
    };
}

@end

/////////////////////////////////////////////////////////////////////////////////////////

@implementation YLPNeonEdgeCorner

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    if (self) {
        self.constraint = [[YLPNeonViewConstraint alloc] initWithType:YLPNeonConstraintType_EdgeCorner];
        self.constraint.superViewSize(view.superview.frame.size);
    }
    return self;
}

#pragma mark - Public
- (YLPNeonConstraint *)topLeft {
    self.constraint.edgeCornerType(YLPNeonConstraintEdgeCornerType_TopLeft);
    return self.constraint;
}

- (YLPNeonConstraint *)topRight {
    self.constraint.edgeCornerType(YLPNeonConstraintEdgeCornerType_TopRight);
    return self.constraint;
}

- (YLPNeonConstraint *)bottomLeft {
    self.constraint.edgeCornerType(YLPNeonConstraintEdgeCornerType_BottomLeft);
    return self.constraint;
}

- (YLPNeonConstraint *)bottomRight {
    self.constraint.edgeCornerType(YLPNeonConstraintEdgeCornerType_BottomRight);
    return self.constraint;
}

@end
