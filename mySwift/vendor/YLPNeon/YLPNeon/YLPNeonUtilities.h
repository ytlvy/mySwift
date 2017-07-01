//
//  YLPNeonUtilities.h
//  YLPNeon <https://github.com/iastrolien/YLPNeon>
//
//  Created by peter on 16/4/14.
//  Copyright © 2016年 iastrolien. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#ifndef YLPNeonUtilities_h
#define YLPNeonUtilities_h


#define YLPNeonName @"YLPNeon"

#define YLPNeonShowLog 1

#if (defined DEBUG) || (defined _DEBUG) || YLPNeonShowLog

    # define YLPNeonNSLog(...) NSLog(__VA_ARGS__)

#else

    # define YLPNeonNSLog(...) {}

#endif

#if (defined DEBUG) || (defined _DEBUG)


#else


#endif

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE || TARGET_OS_TV

    #import <UIKit/UIKit.h>
    #define YLPNeon_View UIView

#elif TARGET_OS_MAC

    #import <AppKit/AppKit.h>
    #define YLPNeon_View NSView

#endif

#ifndef YLPMacro

    #define YLPNeon_SWAP(_a_, _b_)  do { __typeof__(_a_) _tmp_ = (_a_); (_a_) = (_b_); (_b_) = _tmp_; } while (0)
    #define YLPNeon_MAX(_a_, _b_)   _a_ >= _b_ ? _a_ : _b_
    #define YLPNeon_MIN(_a_, _b_)   _a_ <= _b_ ? _a_ : _b_

    #define YLPNeon_MethodNotImplemented() \
         @throw [NSException exceptionWithName:NSInternalInconsistencyException \
                                        reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
                                      userInfo:nil]

#endif


/**
 =======================================================
 
      YLPCornerTopLeft    YLPCornerTopRight
            o-------------------o
            |                   |
            |                   |
            |                   |
            |                   |
            |                   |
            |                   |
            |                   |
            o-------------------o
   YLPCornerBottomLeft     YLPCornerBottomRight
 
 =======================================================
 **/

/**
 *  Specifies a corner of a frame.
 */
typedef NS_ENUM(NSUInteger, YLPCorner) {
    /**
     *  The upper-left corner of the frame.
     */
    YLPCornerTopLeft,
    /**
     *  The upper-right corner of the frame.
     */
    YLPCornerTopRight,
    /**
     *  The bottom-left corner of the frame.
     */
    YLPCornerBottomLeft,
    /**
     *  The upper-right corner of the frame.
     */
    YLPCornerBottomRight,
};

/**
 =======================================================
 
                 YLPEdgeTop
            o-------------------o
            |                   |
            |                   |
            |                   |
YLPEdgeLeft |                   |  YLPEdgeRight
            |                   |
            |                   |
            |                   |
            o-------------------o
                YLPEdgeBottom
 
 =======================================================
 **/

/**
 *  Specifies an edge, or face, of a frame.
 */
typedef NS_ENUM(NSUInteger, YLPEdge) {
    /**
     *  The top edge of the frame.
     */
    YLPEdgeTop,
    /**
     *  The left edge of the frame.
     */
    YLPEdgeLeft,
    /**
     *  The bottom edge of the frame.
     */
    YLPEdgeBottom,
    /**
     *  The right edge of the frame.
     */
    YLPEdgeRight,
};


/**
 =======================================================
         alignToTheRightMatchingTop
        o-------o       o---o
        |       |       | B |
        |   A   |       o---o
        |       |
        o-------o
 
 =======================================================
 **/

/**
 *  Specifies how a view will be aligned relative to the sibling view.
 */
typedef NS_ENUM(NSUInteger, YLPAlign) {
    /**
     *  Specifies that the view should be aligned to the right of a sibling, matching the top, or y origin, of the sibling's frame.
     */
    YLPAlignToTheRightMatchingTop,
    /**
     *  Specifies that the view should be aligned to the right of a sibling, matching the bottom, or max y value, of the sibling's frame.
     */
    YLPAlignToTheRightMatchingBottom,
    /**
     *  Specifies that the view should be aligned to the right of a sibling, and will be centered to either match the vertical center of the sibling's frame or centered vertically within the superview, depending on the context.
     */
    YLPAlignToTheRightCentered,
    /**
     *  Specifies that the view should be aligned to the left of a sibling, matching the top, or y origin, of the sibling's frame.
     */
    YLPAlignToTheLeftMatchingTop,
    /**
     *  Specifies that the view should be aligned to the left of a sibling, matching the bottom, or max y value, of the sibling's frame.
     */
    YLPAlignToTheLeftMatchingBottom,
    /**
     *  Specifies that the view should be aligned to the left of a sibling, and will be centered to either match the vertical center of the sibling's frame or centered vertically within the superview, depending on the context.
     */
    YLPAlignToTheLeftCentered,
    /**
     *  Specifies that the view should be aligned under a sibling, matching the left, or x origin, of the sibling's frame.
     */
    YLPAlignUnderMatchingLeft,
    /**
     *  Specifies that the view should be aligned under a sibling, matching the right, or max y of the sibling's frame.
     */
    YLPAlignUnderMatchingRight,
    /**
     *  Specifies that the view should be aligned under a sibling, and will be centered to either match the horizontal center of the sibling's frame or centered horizontally within the superview, depending on the context.
     */
    YLPAlignUnderCentered,
    /**
     *  Specifies that the view should be aligned above a sibling, matching the left, or x origin of the sibling's frame.
     */
    YLPAlignAboveMatchingLeft,
    /**
     *  Specifies that the view should be aligned above a sibling, matching the right, or max x of the sibling's frame.
     */
    YLPAlignAboveMatchingRight,
    /**
     *  Specifies that the view should be aligned above a sibling, and will be centered to either match the horizontal center of the sibling's frame or centered horizontally within the superview, depending on the context.
     */
    YLPAlignAboveCentered,
};

/**
 *  Specifies how a group will be laid out.
 */
typedef NS_ENUM(NSUInteger, YLPGroup) {
    /**
     *  Specifies that the views should be aligned relative to eachother horizontally.
     */
    YLPGroupHorizontal,
    /**
     *  Specifies that the views should be aligned relative to eachother vertically.
     */
    YLPGroupVertical,
};


#endif /* YLPNeonUtilities_h */
