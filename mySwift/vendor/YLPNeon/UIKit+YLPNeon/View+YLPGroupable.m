//
//  View+YLPGroupable.m
//  YLPNeon
//
//  Created by Peter on 08/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "View+YLPGroupable.h"
#import "YLPNeonCoordinates.h"

@implementation YLPNeon_View (YLPGroupable)

- (void)groupInCenter:(YLPGroup)group
                views:(NSArray *)views
              padding:(CGFloat)padding
                width:(CGFloat)width
               height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupInCenter", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat xAdjust = 0.0f;
    CGFloat yAdjust = 0.0f;
    
    switch (group) {
        case YLPGroupHorizontal:
        {
            xOrigin = (self.width - views.count * width - (views.count - 1) * padding) / 2.0f;
            yOrigin = (self.height / 2.0f) - (height / 2.0f);
            xAdjust = width + padding;
        }
            break;
        case YLPGroupVertical:
        {
            xOrigin = (self.width / 2.0f) - (width / 2.0f);
            yOrigin = (self.height - views.count * height - (views.count - 1) * padding) / 2.0f;
            yAdjust = height + padding;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        xOrigin += xAdjust;
        yOrigin += yAdjust;
    }
}

- (void)groupAndFill:(YLPGroup)group
               views:(NSArray *)views
             padding:(CGFloat)padding {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAndFill", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = padding;
    CGFloat yOrigin = padding;
    CGFloat xAdjust = 0.0f;
    CGFloat yAdjust = 0.0f;
    CGFloat width = 0.0f;
    CGFloat height = 0.0f;
    
    switch (group) {
        case YLPGroupHorizontal:
        {
            width = (self.width - (views.count + 1) * padding) / views.count;
            height = self.height - 2 * padding;
            xAdjust = width + padding;
        }
            break;
        case YLPGroupVertical:
        {
            width = self.width - 2 * padding;
            height = (self.height - (views.count + 1) * padding) / views.count;
            yAdjust = height + padding;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        xOrigin += xAdjust;
        yOrigin += yAdjust;
    }
}

- (void)groupAndFill:(YLPGroup)group
               views:(NSArray *)views
             padding:(CGFloat)padding
               width:(CGFloat)width
              height:(CGFloat)height {
    if (views.count < 1) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAndFill", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = padding;
    CGFloat yOrigin = padding;
    CGFloat xAdjust = 0.0f;
    CGFloat yAdjust = 0.0f;
    CGFloat viewsPadding = 0.0f;
    
    switch (group) {
        case YLPGroupHorizontal:
        {
            viewsPadding = (self.width - 2 * padding - width * views.count) / (views.count - 1);
            xAdjust = width + viewsPadding;
        }
            break;
        case YLPGroupVertical:
        {
            viewsPadding = (self.height - 2 * padding - width * views.count) / (views.count - 1);
            yAdjust = height + viewsPadding;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        xOrigin += xAdjust;
        yOrigin += yAdjust;
    }
}

- (void)groupAgainstEdge:(YLPGroup)group
                   views:(NSArray *)views
             againstEdge:(YLPEdge)edge
                 padding:(CGFloat)padding
                   width:(CGFloat)width
                  height:(CGFloat)height {
    switch (group) {
        case YLPGroupHorizontal:
        {
            [self _groupAgainstEdgeHorizontal:views
                                  againstEdge:edge
                                      padding:padding
                                        width:width
                                       height:height];
        }
            break;
        case YLPGroupVertical:
        {
            [self _groupAgainstEdgeVertical:views
                                againstEdge:edge
                                    padding:padding
                                      width:width
                                     height:height];
        }
    }
}

- (void)groupInCorner:(YLPGroup)group
                views:(NSArray *)views
             inCorner:(YLPCorner)corner
              padding:(CGFloat)padding
                width:(CGFloat)width
               height:(CGFloat)height {
    switch (group) {
        case YLPGroupHorizontal:
        {
            [self _groupInCornerHorizontal:views
                                  inCorner:corner
                                   padding:padding
                                     width:width
                                    height:height];
        }
            break;
        case YLPGroupVertical:
        {
            [self _groupInCornerVertical:views
                                inCorner:corner
                                 padding:padding
                                   width:width
                                  height:height];
        }
            break;
    }
}

- (void)groupAndAlign:(YLPGroup)group
             andAlign:(YLPAlign)align
                viwes:(NSArray *)views
           relativeTo:(YLPNeon_View *)sibling
              padding:(CGFloat)padding
                width:(CGFloat)width
               height:(CGFloat)height {
    if (group == YLPGroupHorizontal) {
        [self _groupAndAlignHorizontal:align
                                 views:views
                            relativeTo:sibling
                               padding:padding
                                 width:width
                                height:height];
    } else if (group == YLPGroupVertical) {
        [self _groupAndAlignVertical:align
                              viedws:views
                          relativeTo:sibling
                             padding:padding
                               width:width
                              height:height];
    }
}

- (void)groupAndAlign:(YLPGroup)group
             andAlign:(YLPAlign)align
                viwes:(NSArray *)views
         viewsPadding:(CGFloat)viewsPadding
           relativeTo:(YLPNeon_View *)sibling
              padding:(CGFloat)padding
             maxWidth:(CGFloat)maxWidth
            maxHeight:(CGFloat)maxHeight {
    if (group == YLPGroupHorizontal) {
        [self _groupAndAlignHorizontal:align
                                 views:views
                          viewsPadding:viewsPadding
                            relativeTo:sibling
                               padding:padding
                             maxHeight:maxHeight];
    } else if (group == YLPGroupVertical) {
        [self _groupAndAlignVertical:align
                              viedws:views
                        viewsPadding:viewsPadding
                          relativeTo:sibling
                             padding:padding
                            maxWidth:maxWidth];
    }
}

#pragma mark - private method
- (void)_groupAgainstEdgeHorizontal:(NSArray *)views
                        againstEdge:(YLPEdge)edge
                            padding:(CGFloat)padding
                              width:(CGFloat)width
                             height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAgainstEdgeHorizontal", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat xAdjust = width + padding;
    
    switch (edge) {
        case YLPEdgeTop:
        {
            xOrigin = (self.width - views.count * width - (views.count - 1) * padding) / 2.0f;
            yOrigin = padding;
        }
            break;
        case YLPEdgeLeft:
        {
            xOrigin = padding;
            yOrigin = self.height / 2.0f - height / 2.0f;
        }
            break;
        case YLPEdgeBottom:
        {
            xOrigin = (self.width - views.count * width - (views.count - 1) * padding) / 2.0f;
            yOrigin = self.height - height - padding;
        }
            break;
        case YLPEdgeRight:
        {
            xOrigin = self.width - views.count * width - views.count * padding;
            yOrigin = self.height / 2.0f - height / 2.0f;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        xOrigin += xAdjust;
    }
}

- (void)_groupAgainstEdgeVertical:(NSArray *)views
                      againstEdge:(YLPEdge)edge
                          padding:(CGFloat)padding
                            width:(CGFloat)width
                           height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAgainstEdgeVertical", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat yAdjust = height + padding;
    
    switch (edge) {
        case YLPEdgeTop:
        {
            xOrigin = self.width / 2.0f - width / 2.0f;
            yOrigin = padding;
        }
            break;
        case YLPEdgeLeft:
        {
            xOrigin = padding;
            yOrigin = (self.height - views.count * height - (views.count - 1) * padding) / 2.0f;
        }
            break;
        case YLPEdgeBottom:
        {
            xOrigin = self.width / 2.0f - width / 2.0f;
            yOrigin = self.height - views.count * height - views.count * padding;
        }
            break;
        case YLPEdgeRight:
        {
            xOrigin = self.width - width - padding;
            yOrigin = (self.height - views.count * height - (views.count - 1) * padding) / 2.0f;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        yOrigin += yAdjust;
    }
}

- (void)_groupInCornerHorizontal:(NSArray *)views
                        inCorner:(YLPCorner)corner
                         padding:(CGFloat)padding
                           width:(CGFloat)width
                          height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupInCornerHorizontal", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat xAdjust = width + padding;
    
    switch (corner) {
        case YLPCornerTopLeft:
        {
            xOrigin = padding;
            yOrigin = padding;
        }
            break;
        case YLPCornerTopRight:
        {
            xOrigin = self.width - views.count * width - views.count * padding;
            yOrigin = padding;
        }
            break;
        case YLPCornerBottomLeft:
        {
            xOrigin = padding;
            yOrigin = self.height - height - padding;
        }
            break;
        case YLPCornerBottomRight:
        {
            xOrigin = self.width - views.count * width - views.count * padding;
            yOrigin = self.height - height - padding;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        xOrigin += xAdjust;
    }
}

- (void)_groupInCornerVertical:(NSArray *)views
                      inCorner:(YLPCorner)corner
                       padding:(CGFloat)padding
                         width:(CGFloat)width
                        height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupInCornerVertical", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat yAdjust = height + padding;
    
    switch (corner) {
        case YLPCornerTopLeft:
        {
            xOrigin = padding;
            yOrigin = padding;
        }
            break;
        case YLPCornerTopRight:
        {
            xOrigin = self.width - width - padding;
            yOrigin = padding;
        }
            break;
        case YLPCornerBottomLeft:
        {
            xOrigin = padding;
            yOrigin = self.height - views.count * height - views.count * padding;
        }
            break;
        case YLPCornerBottomRight:
        {
            xOrigin = self.width - width - padding;
            yOrigin = self.height - views.count * height - views.count * padding;
        }
            break;
    }
    
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        yOrigin += yAdjust;
    }
}

- (void)_groupAndAlignHorizontal:(YLPAlign)align
                           views:(NSArray *)views
                      relativeTo:(YLPNeon_View *)sibling
                         padding:(CGFloat)padding
                           width:(CGFloat)width
                          height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAndAlignHorizontal", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat xAdjust = width + padding;
    
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMax - height;
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMid - (height / 2.0f);
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            xOrigin = sibling.x - views.count * width - views.count * padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            xOrigin = sibling.x - views.count * width - views.count * padding;
            yOrigin = sibling.yMax - height;
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            xOrigin = sibling.x - views.count * width - views.count * padding;
            yOrigin = sibling.yMid - (height / 2.0f);
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            xOrigin = sibling.xMax - views.count * width - (views.count - 1) * padding;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderCentered:
        {
            xOrigin = sibling.xMid - (views.count * width + (views.count - 1) * padding) / 2.0f;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.y - height - padding;
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            xOrigin = sibling.xMax - views.count * width - (views.count - 1) * padding;
            yOrigin = sibling.y - height - padding;
        }
            break;
        case YLPAlignAboveCentered:
        {
            xOrigin = sibling.xMid - (views.count * width + (views.count - 1) * padding) / 2.0f;
            yOrigin = sibling.y - height - padding;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        xOrigin += xAdjust;
    }
}

- (void)_groupAndAlignHorizontal:(YLPAlign)align
                           views:(NSArray *)views
                    viewsPadding:(CGFloat)viewsPadding
                      relativeTo:(YLPNeon_View *)sibling
                         padding:(CGFloat)padding
                       maxHeight:(CGFloat)maxHeight {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAndAlignHorizontal", YLPNeonName);
        return;
    }
    
    YLPNeon_View *firstView = views.firstObject;
    NSAssert([firstView isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
    CGFloat width   = firstView.width;
    CGFloat height  = YLPNeon_MIN(firstView.height, maxHeight);
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat xAdjust = width + padding;
    CGFloat allViewWidth = 0.0f;
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        allViewWidth += view.width;
    }
    
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMax - height;
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMid - (height / 2.0f);
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            xOrigin = sibling.x - allViewWidth - views.count * padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            xOrigin = sibling.x - allViewWidth - views.count * padding;
            yOrigin = sibling.yMax - height;
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            xOrigin = sibling.x - allViewWidth - views.count * padding;
            yOrigin = sibling.yMid - (height / 2.0f);
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            xOrigin = sibling.xMax - allViewWidth - (views.count - 1) * padding;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderCentered:
        {
            xOrigin = sibling.xMid - (allViewWidth + (views.count - 1) * padding) / 2.0f;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.y - height - padding;
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            xOrigin = sibling.xMax - allViewWidth - (views.count - 1) * padding;
            yOrigin = sibling.y - height - padding;
        }
            break;
        case YLPAlignAboveCentered:
        {
            xOrigin = sibling.xMid - (allViewWidth + (views.count - 1) * padding) / 2.0f;
            yOrigin = sibling.y - height - padding;
        }
            break;
    }
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        CGFloat tempWidth  = view.width;
        CGFloat tempHeight = YLPNeon_MIN(view.height, maxHeight);
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, tempWidth, tempHeight) scale:1.0f]];
        xOrigin += xAdjust;
        xAdjust = tempWidth + padding;
    }
}

- (void)_groupAndAlignVertical:(YLPAlign)align
                        viedws:(NSArray *)views
                    relativeTo:(YLPNeon_View *)sibling
                       padding:(CGFloat)padding
                         width:(CGFloat)width
                        height:(CGFloat)height {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAndAlignVertical", YLPNeonName);
        return;
    }
    
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat yAdjust = height + padding;
    
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMax - views.count * height - (views.count - 1) * padding;
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMid - (views.count * height + (views.count - 1) * padding) / 2.0f;
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.yMax - views.count * height - (views.count - 1) * padding;
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.yMid - (views.count * height + (views.count - 1) * padding) / 2.0f;
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            xOrigin = sibling.xMax - width;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderCentered:
        {
            xOrigin = sibling.xMid - width / 2.0f;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.y - views.count * height - views.count * padding;
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            xOrigin = sibling.xMax - width;
            yOrigin = sibling.y - views.count * height - views.count * padding;
        }
            break;
        case YLPAlignAboveCentered:
        {
            xOrigin = sibling.xMid - width / 2.0f;
            yOrigin = sibling.y - views.count * height - views.count * padding;
        }
            break;
    }
    
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, width, height) scale:1.0f]];
        yOrigin += yAdjust;
    }
}

- (void)_groupAndAlignVertical:(YLPAlign)align
                        viedws:(NSArray *)views
                  viewsPadding:(CGFloat)viewsPadding
                    relativeTo:(YLPNeon_View *)sibling
                       padding:(CGFloat)padding
                      maxWidth:(CGFloat)maxWidth {
    if (views.count <= 0) {
        YLPNeonNSLog(@"%@:  UIView+YLPGroupable     No subviews provided to groupAndAlignVertical", YLPNeonName);
        return;
    }
    
    YLPNeon_View *firstView = views.firstObject;
    NSAssert([firstView isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
    CGFloat width   = YLPNeon_MIN(firstView.width, maxWidth);
    CGFloat height  = firstView.height;
    CGFloat xOrigin = 0.0f;
    CGFloat yOrigin = 0.0f;
    CGFloat yAdjust = height + viewsPadding;
    CGFloat allViewHeight = 0.0f;
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        allViewHeight += view.height;
    }
    
    switch (align) {
        case YLPAlignToTheRightMatchingTop:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheRightMatchingBottom:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMax - allViewHeight - (views.count - 1) * viewsPadding;
        }
            break;
        case YLPAlignToTheRightCentered:
        {
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMid - (allViewHeight + (views.count - 1) * viewsPadding) / 2.0f;
        }
            break;
        case YLPAlignToTheLeftMatchingTop:
        {
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.y;
        }
            break;
        case YLPAlignToTheLeftMatchingBottom:
        {
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.yMax - allViewHeight - (views.count - 1) * viewsPadding;
        }
            break;
        case YLPAlignToTheLeftCentered:
        {
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.yMid - (allViewHeight + (views.count - 1) * viewsPadding) / 2.0f;
        }
            break;
        case YLPAlignUnderMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderMatchingRight:
        {
            xOrigin = sibling.xMax - width;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignUnderCentered:
        {
            xOrigin = sibling.xMid - width / 2.0f;
            yOrigin = sibling.yMax + padding;
        }
            break;
        case YLPAlignAboveMatchingLeft:
        {
            xOrigin = sibling.x;
            yOrigin = sibling.y - allViewHeight - views.count * viewsPadding;
        }
            break;
        case YLPAlignAboveMatchingRight:
        {
            xOrigin = sibling.xMax - width;
            yOrigin = sibling.y - allViewHeight - views.count * viewsPadding;
        }
            break;
        case YLPAlignAboveCentered:
        {
            xOrigin = sibling.xMid - width / 2.0f;
            yOrigin = sibling.y - allViewHeight - views.count * viewsPadding;
        }
            break;
    }
    
    for (YLPNeon_View *view in views) {
        NSAssert([view isKindOfClass:[YLPNeon_View class]], @"All objects in the array must be views");
        CGFloat tempWidth  = YLPNeon_MIN(view.width, maxWidth);
        CGFloat tempHeight = view.height;
        [view setFrame:[YLPNeonCoordinates ylp_adjustRectToDisplayScale:CGRectMake(xOrigin, yOrigin, tempWidth, tempHeight) scale:1.0f]];
        yOrigin += yAdjust;
        yAdjust = tempHeight + viewsPadding;
    }
}

@end
