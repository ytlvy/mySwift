//
//  View+YLPAlignable.m
//  YLPNeon
//
//  Created by Peter on 08/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "View+YLPAlignable.h"
#import "View+YLPNeon.h"

@implementation YLPNeon_View (YLPAlignable)

- (void)align:(YLPAlign)align
   relativeTo:(YLPNeon_View *)sibling
      padding:(CGFloat)padding
        width:(CGFloat)width
       height:(CGFloat)height {
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).size(CGSizeMake(width, height));
            }];
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(sibling.height - height).size(CGSizeMake(width, height));
            }];
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset((sibling.height - height) / 2).size(CGSizeMake(width, height));
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).size(CGSizeMake(width, height));
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(sibling.height - height).size(CGSizeMake(width, height));
            }];
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset((sibling.height - height) / 2).width(width).height(height);
            }];
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.under(sibling).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(sibling.width - width).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignUnderCentered:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset((sibling.width - width) / 2).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.above(sibling).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(sibling.width - width).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignAboveCentered:
        {
            [self ylp_neonMakeAlign:^(id <YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset((sibling.width - width) / 2).yOffset(padding).width(width).height(height);
            }];
        }
            break;
    }
}

- (void)alignAndFillWidth:(YLPAlign)align
               relativeTo:(YLPNeon_View *)sibling
                  padding:(CGFloat)padding
                   height:(CGFloat)height {
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(0).width(self.superview.width - sibling.xMax - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(sibling.height - height).width(self.superview.width - sibling.xMax - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset((sibling.height - height) / 2).width(self.superview.width - sibling.xMax - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(0).width(sibling.x - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(sibling.height - height).width(sibling.x - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset((sibling.height - height) / 2).width(sibling.x - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(0).yOffset(padding).width(self.superview.width - sibling.x - padding).height(height);
            }];
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(sibling.xMax - padding).height(height);
            }];
        }
            break;
        case YLPAlignUnderCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(self.superview.width - 2 * padding).height(height);
            }];
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(0).yOffset(padding).width(self.superview.width - sibling.x - padding).height(height);
            }];
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(sibling.xMax - padding).height(height);
            }];
        }
            break;
        case YLPAlignAboveCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(self.superview.width - 2 * padding).height(height);
            }];
        }
            break;
    }
}

- (void)alignAndFillHeight:(YLPAlign)align
                relativeTo:(YLPNeon_View *)sibling
                   padding:(CGFloat)padding
                     width:(CGFloat)width {
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(0).width(width).height(self.superview.height - sibling.y - padding);
            }];
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).height(sibling.yMax - padding).width(width);
            }];
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).height(self.superview.height - 2 * padding).width(width);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(0).width(width).height(self.superview.height - sibling.y - padding);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).width(width).height(sibling.yMax - padding);
            }];
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).width(width).height(self.superview.height - 2 * padding);
            }];
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(0).yOffset(padding).width(width).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(sibling.width - width).yOffset(padding).width(width).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignUnderCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset((sibling.width - width) / 2.0f).yOffset(padding).width(width).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(0).yOffset(padding).width(width).height(sibling.y - 2 * padding);
            }];
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(sibling.width - width).yOffset(padding).width(width).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignAboveCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset((sibling.width - width) / 2.0f).yOffset(padding).width(width).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
    }
}

- (void)alignAndFill:(YLPAlign)align
          relativeTo:(YLPNeon_View *)sibling
             padding:(CGFloat)padding {
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(0).width(self.superview.width - sibling.xMax - 2 * padding).height(self.superview.height - sibling.y - padding);
            }];
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).width(self.superview.width - sibling.xMax - 2 * padding).height(sibling.yMax - padding);
            }];
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).width(self.superview.width - sibling.xMax - 2 * padding).height(self.superview.height - 2 * padding);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(0).width(sibling.x - 2 * padding).height(self.superview.height - sibling.y - padding);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).width(sibling.x - 2 * padding).height(sibling.yMax - padding);
            }];
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(sibling).xOffset(padding).yOffset(-(sibling.y - padding)).width(sibling.x - 2 * padding).height(self.superview.height - 2 * padding);
            }];
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(0).yOffset(padding).width(self.superview.width - sibling.x - padding).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(sibling.xMax - padding).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignUnderCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(self.superview.width - 2 * padding).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(0).yOffset(padding).width(self.superview.width - sibling.x - padding).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(sibling.xMax - padding).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        case YLPAlignAboveCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(sibling).xOffset(-(sibling.x - padding)).yOffset(padding).width(self.superview.width - 2 * padding).height(self.superview.height - sibling.yMax - 2 * padding);
            }];
        }
            break;
        default:
        {
            YLPNeonNSLog(@"%@:  UIView+YLPAlignable     Invalid Align specified for alignAndFill", YLPNeonName);
        }
            break;
    }
}

- (void)alignBetweenHorizontal:(YLPAlign)align
                   primaryView:(YLPNeon_View *)primaryView
                 secondaryView:(YLPNeon_View *)secondaryView
                       padding:(CGFloat)padding
                        height:(CGFloat)height {
    CGFloat width = self.superview.width - primaryView.xMax - (self.superview.width - secondaryView.x) - 2 * padding;
    if (width < 0) width = -1 * width;
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(primaryView).xOffset(padding).yOffset(0).width(width).height(height);
            }];
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(primaryView).xOffset(padding).yOffset(-(height - primaryView.height)).width(width).height(height);
            }];
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.right(primaryView).xOffset(padding).yOffset((primaryView.height - height) / 2).width(width).height(height);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(primaryView).xOffset(padding).yOffset(0).width(width).height(height);
            }];
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(primaryView).xOffset(padding).yOffset(-(height - primaryView.height)).width(width).height(height);
            }];
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.left(primaryView).xOffset(padding).yOffset((primaryView.height - height) / 2).width(width).height(height);
            }];
        }
            break;
        default:
        {
            YLPNeonNSLog(@"%@:  UIView+YLPAlignable     Invalid Align specified for alignBetweenHorizonal", YLPNeonName);
        }
            break;
    }
}

- (void)alignBetweenHorizontal:(YLPAlign)align
                   primaryView:(YLPNeon_View *)primaryView
                 secondaryView:(YLPNeon_View *)secondaryView {
    CGFloat betweenViewWidth = self.superview.width - primaryView.xMax - (self.superview.width - secondaryView.x);
    if (betweenViewWidth < 0) betweenViewWidth = -1 * betweenViewWidth;
    CGFloat padding = (betweenViewWidth - self.width) / 2;
    if (padding < 0.0f) {
        YLPNeonNSLog(@"%@:  UIView+YLPAlignable     alignBetweenHorizontal betweenViewWidth < self.width  and  padding < 0", YLPNeonName);
        return ;
    }
    [self alignBetweenHorizontal:align primaryView:primaryView secondaryView:secondaryView padding:padding height:self.height];
}

- (void)alignBetweenVertical:(YLPAlign)align
                 primaryView:(YLPNeon_View *)primaryView
               secondaryView:(YLPNeon_View *)secondaryView
                     padding:(CGFloat)padding
                       width:(CGFloat)width {
    CGFloat height = self.superview.height - primaryView.yMax - (self.superview.height - secondaryView.y) - 2 * padding;
    if (height < 0) height = -1 * height;
    
    switch (align) {
        case YLPAlignUnderMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(primaryView).xOffset(0).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(primaryView).xOffset(primaryView.width - width).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignUnderCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.under(primaryView).xOffset((primaryView.width - width) / 2).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(primaryView).xOffset(0).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(primaryView).xOffset(primaryView.width - width).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        case YLPAlignAboveCentered:
        {
            [self ylp_neonMakeAlign:^(id<YLPNeonAlignLayout> align) {
                align.above(primaryView).xOffset((primaryView.width - width) / 2).yOffset(padding).width(width).height(height);
            }];
        }
            break;
        default:
        {
            YLPNeonNSLog(@"%@:  UIView+YLPAlignable     Invalid Align specified for alignBetweenVertical", YLPNeonName);
        }
            break;
    }
}

- (void)alignBetweenVertical:(YLPAlign)align
                 primaryView:(YLPNeon_View *)primaryView
               secondaryView:(YLPNeon_View *)secondaryView {
    CGFloat betweenViewHeight = self.superview.height - primaryView.yMax - (self.superview.height - secondaryView.y);
    if (betweenViewHeight < 0) betweenViewHeight = -1 * betweenViewHeight;
    CGFloat padding = (betweenViewHeight - self.height) / 2;
    if (padding < 0.0f) {
        YLPNeonNSLog(@"%@:  UIView+YLPAlignable     alignBetweenVertical betweenViewHeight < self.height  and  padding < 0", YLPNeonName);
        return ;
    }
    [self alignBetweenVertical:align primaryView:primaryView secondaryView:secondaryView padding:0.0f width:self.width];
}

@end
