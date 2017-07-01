//
//  YLPNeonLayoutProtocol.h
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#ifndef YLPNeonLayoutProtocol_h
#define YLPNeonLayoutProtocol_h

#import "YLPNeonConstraint.h"

@protocol YLPNeonAlignLayout <NSObject>

- (YLPNeonConstraint * (^)(UIView *relativeView))above;
- (YLPNeonConstraint * (^)(UIView *relativeView))under;
- (YLPNeonConstraint * (^)(UIView *relativeView))left;
- (YLPNeonConstraint * (^)(UIView *relativeView))right;

@end

@protocol YLPNeonCornerLayout <NSObject>

- (YLPNeonConstraint *)topLeft;
- (YLPNeonConstraint *)topRight;
- (YLPNeonConstraint *)bottomLeft;
- (YLPNeonConstraint *)bottomRight;

@end

#endif /* YLPNeonLayoutProtocol_h */
