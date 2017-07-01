//
//  View+YLPAnchorable.m
//  YLPNeon
//
//  Created by Peter on 08/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "View+YLPAnchorable.h"
#import "View+YLPNeon.h"

@implementation YLPNeon_View (YLPAnchorable)

- (void)fillSuperview:(CGFloat)left
                right:(CGFloat)right
                  top:(CGFloat)top
               bottom:(CGFloat)bottom {
    CGFloat width = self.superview.width - (left + right);
    CGFloat height = self.superview.height - (top + bottom);
    [self setFrame:CGRectMake(left, top, width, height)];
}

- (void)anchorInCenter:(CGFloat)width
                height:(CGFloat)height {
    CGFloat xOrigin = (self.superview.width / 2.0f) - (width / 2.0f);
    CGFloat yOrigin = (self.superview.height / 2.0f) - (height / 2.0f);
    [self setFrame:CGRectMake(xOrigin, yOrigin, width, height)];
}

- (void)anchorInCorner:(YLPCorner)corner
                  xPad:(CGFloat)xPad
                  yPad:(CGFloat)yPad
                 width:(CGFloat)width
                height:(CGFloat)height {
    if (corner == YLPCornerTopLeft) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topLeft.xOffset(xPad).yOffset(yPad).width(width).height(height);
        }];
    } else if (corner == YLPCornerTopRight) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topRight.xOffset(xPad).yOffset(yPad).width(width).height(height);
        }];
    } else if (corner == YLPCornerBottomLeft) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.bottomLeft.xOffset(xPad).yOffset(yPad).width(width).height(height);
        }];
    } else if (corner == YLPCornerBottomRight) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.bottomRight.xOffset(xPad).yOffset(yPad).width(width).height(height);
        }];
    }
}

- (void)anchorToEdge:(YLPEdge)edge padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {
    if (edge == YLPEdgeTop) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topRight.xOffset((self.superview.width - width) / 2.0f).yOffset(padding).width(width).height(height);
        }];
    } else if (edge == YLPEdgeLeft) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topLeft.xOffset(padding).yOffset((self.superview.height - height) / 2.0f).width(width).height(height);
        }];
    } else if (edge == YLPEdgeBottom) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.bottomLeft.xOffset((self.superview.width - width) / 2.0f).yOffset(padding).width(width).height(height);
        }];
    } else if (edge == YLPEdgeRight) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.bottomRight.xOffset(padding).yOffset((self.superview.height - height) / 2.0f).width(width).height(height);
        }];
    }
}

- (void)anchorAndFillEdge:(YLPEdge)edge
                     xPad:(CGFloat)xPad
                     yPad:(CGFloat)yPad
                otherSize:(CGFloat)otherSize {
    if (edge == YLPEdgeTop) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topLeft.xOffset(xPad).yOffset(yPad).width(self.superview.width - 2 * xPad).height(otherSize);
        }];
    } else if (edge == YLPEdgeLeft) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topLeft.xOffset(xPad).yOffset(yPad).width(otherSize).height(self.superview.height - 2 * yPad);
        }];
    } else if (edge == YLPEdgeBottom) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.bottomLeft.xOffset(xPad).yOffset(yPad).width(self.superview.width - 2 * xPad).height(otherSize);
        }];
    } else if (edge == YLPEdgeRight) {
        [self ylp_neonMakeEdgeCorner:^(id<YLPNeonCornerLayout> edgeCorner) {
            edgeCorner.topRight.xOffset(xPad).yOffset(yPad).width(otherSize).height(self.superview.height - 2 * yPad);
        }];
    }
}

@end
