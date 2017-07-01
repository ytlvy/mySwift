//
//  View+YLPAlignable.h
//  YLPNeon
//
//  Created by Peter on 08/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "View+YLPFrameable.h"

@interface YLPNeon_View (YLPAlignable)

/**
 =======================================================
        YLPAlignToTheRightMatchingTop
        o---------o padding o---o
        |         |---------|   | height
        | sibling |         o---o
        |         |         width
        o---------o
 =======================================================
 **/
/**
 *  Align a view relative to a sibling view in the same superview.
 *
 *  @param align   The `Align` type used to specify where and how this view is aligned with its sibling.
 *  @param sibling The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares the same superview as this view, and that the sibling view is not the same as this view, otherwise a `fatalError` is thrown.
 *  @param padding The padding to be applied between this view and the sibling view, which is applied differently depending on the `Align` specified. For example, if aligning `.ToTheRightOfMatchingTop` the padding is used to adjust the x origin of this view so it sits to the right of the sibling view, while the y origin is automatically calculated to match the sibling view.
 *  @param width   The width of the view.
 *  @param height  The height of the view.
 */
- (void)align:(YLPAlign)align
   relativeTo:(YLPNeon_View *)sibling
      padding:(CGFloat)padding
        width:(CGFloat)width
       height:(CGFloat)height;

/**
 =======================================================
        YLPAlignToTheRightMatchingTop
        o-----------------------o
        |                       |
        |  o------------o o---o |
        |  |            | |   | |
        |  |            |p|   |p|
        |  |   sibling  | |   | |
        |  |            | |   | | height
        |  |            | |   | |
        |  o------------o |   | |
        |                 o---o |
        o-----------------------o
 =======================================================
 **/
/**
 *  Align a view relative to a sibling view in the same superview, and automatically expand the width to fill the superview with equal padding between the superview and sibling view.
 *
 *  @param align   The `Align` type used to specify where and how this view is aligned with its sibling.
 *  @param sibling The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares the same superview as this view, and that the sibling view is not the same as this view, otherwise a `fatalError` is thrown.
 *  @param padding The padding to be applied between this view, the sibling view and the superview.
 *  @param height  The height of the view.
 */
- (void)alignAndFillWidth:(YLPAlign)align
               relativeTo:(YLPNeon_View *)sibling
                  padding:(CGFloat)padding
                   height:(CGFloat)height;

/**
 =======================================================
        YLPAlignToTheRightMatchingTop
        o-----------------------o
        |                 width |
        |  o------------o o---o |
        |  |            | |   | |
        |  |            |p|   | |
        |  |   sibling  | |   | |
        |  |            | |   | |
        |  |            | |   | |
        |  o------------o |   | |
        |                 o---o |
        |                   p   |
        o-----------------------o
 =======================================================
 **/
/**
 *  Align a view relative to a sibling view in the same superview, and automatically expand the height to fill the superview with equal padding between the superview and sibling view.
 *
 *  @param align   The `Align` type used to specify where and how this view is aligned with its sibling.
 *  @param sibling The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares the same superview as this view, and that the sibling view is not the same as this view, otherwise a `fatalError` is thrown.
 *  @param padding The padding to be applied between this view, the sibling view and the superview.
 *  @param width   The width of the view.
 */
- (void)alignAndFillHeight:(YLPAlign)align
                relativeTo:(YLPNeon_View *)sibling
                   padding:(CGFloat)padding
                     width:(CGFloat)width;

/**
 =======================================================
        YLPAlignToTheRightMatchingTop
        o-----------------------o
        |                       |
        |  o------------o o---o |
        |  |            | |   | |
        |  |            |p|   |p|
        |  |   sibling  | |   | |
        |  |            | |   | |
        |  |            | |   | |
        |  o------------o |   | |
        |                 o---o |
        |                   p   |
        o-----------------------o
 =======================================================
 **/
/**
 *  Align a view relative to a sibling view in the same superview, and automatically expand the width AND height to fill the superview with equal padding between the superview and sibling view.
 *
 *  @param align   The `Align` type used to specify where and how this view is aligned with its sibling.
 *  @param sibling The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares the same superview as this view, and that the sibling view is not the same as this view, otherwise a `fatalError` is thrown.
 *  @param padding The padding to be applied between this view, the sibling view and the superview.
 */
- (void)alignAndFill:(YLPAlign)align
          relativeTo:(YLPNeon_View *)sibling
             padding:(CGFloat)padding;

/**
 =======================================================
        YLPAlignToTheRightCentered
        o----------------------o
        |                      |
        |  o---o       o---o   |
        |  |   | o---o |   |   |
        |  |   | |   | |   |   |
        |  | A |p|   | | B |   |
        |  |   | |   | |   |   |
        |  |   | o---o |   |   |
        |  o---o       |   |   |
        |              o---o   |
        |                      |
        o----------------------o
 =======================================================
 **/
/**
 *  Align a view between two sibling views horizontally, automatically expanding the width to extend the full horizontal span between the `primaryView` and the `secondaryView`, with equal padding on both sides.
 *
 *  @param align         The `Align` type used to specify where and how this view is aligned with the primary view.
 *  @param primaryView   The primary sibling view this view will be aligned relative to.
 *  @param secondaryView The secondary sibling view this view will be automatically sized to fill the space between.
 *  @param padding       The horizontal padding to be applied between this view and both sibling views.
 *  @param height        The height of the view.
 */
- (void)alignBetweenHorizontal:(YLPAlign)align
                   primaryView:(YLPNeon_View *)primaryView
                 secondaryView:(YLPNeon_View *)secondaryView
                       padding:(CGFloat)padding
                        height:(CGFloat)height;

/**
 *  Align a view between two sibling views horizontally, automatically expanding the width to extend the full horizontal span between the `primaryView` and the `secondaryView`, with equal padding on both sides.
 *
 *  @param align         The `Align` type used to specify where and how this view is aligned with the primary view.
 *  @param primaryView   The primary sibling view this view will be aligned relative to.
 *  @param secondaryView The secondary sibling view this view will be automatically sized to fill the space between.
 */
- (void)alignBetweenHorizontal:(YLPAlign)align
                   primaryView:(YLPNeon_View *)primaryView
                 secondaryView:(YLPNeon_View *)secondaryView;

/**
 *  Align a view between two sibling views vertically, automatically expanding the height to extend the full vertical span between the `primaryView` and the `secondaryView`, with equal padding above and below.
 *
 *  @param align         The `Align` type used to specify where and how this view is aligned with the primary view.
 *  @param primaryView   The primary sibling view this view will be aligned relative to.
 *  @param secondaryView The secondary sibling view this view will be automatically sized to fill the space between.
 *  @param padding       The horizontal padding to be applied between this view and both sibling views.
 *  @param width         The width of the view.
 */
- (void)alignBetweenVertical:(YLPAlign)align
                 primaryView:(YLPNeon_View *)primaryView
               secondaryView:(YLPNeon_View *)secondaryView
                     padding:(CGFloat)padding
                       width:(CGFloat)width;

/**
 *  Align a view between two sibling views vertically, automatically expanding the height to extend the full vertical span between the `primaryView` and the `secondaryView`, with equal padding above and below.
 *
 *  @param align         The `Align` type used to specify where and how this view is aligned with the primary view.
 *  @param primaryView   The primary sibling view this view will be aligned relative to.
 *  @param secondaryView The secondary sibling view this view will be automatically sized to fill the space between.
 */
- (void)alignBetweenVertical:(YLPAlign)align
                 primaryView:(YLPNeon_View *)primaryView
               secondaryView:(UIView *)secondaryView;


@end
