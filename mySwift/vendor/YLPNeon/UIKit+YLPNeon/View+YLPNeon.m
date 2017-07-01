//
//  View+YLPNeon.m
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "View+YLPNeon.h"

@implementation YLPNeon_View (YLPNeon)

- (void)ylp_neonMakeAlign:(void (NS_NOESCAPE ^)(id <YLPNeonAlignLayout> ))block {
    self.translatesAutoresizingMaskIntoConstraints = YES;
    YLPNeonAlign *align = [[YLPNeonAlign alloc] initWithView:self];
    block(align);
    [align installNeon];
}

- (void)ylp_neonMakeEdgeCorner:(void (NS_NOESCAPE ^)(id <YLPNeonCornerLayout> ))block {
    self.translatesAutoresizingMaskIntoConstraints = YES;
    YLPNeonEdgeCorner *edgeCorner = [[YLPNeonEdgeCorner alloc] initWithView:self];
    block(edgeCorner);
    [edgeCorner installNeon];
}

@end
