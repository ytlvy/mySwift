//
//  View+YLPNeon.h
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "View+YLPFrameable.h"
#import "YLPNeonLayout.h"

@interface YLPNeon_View (YLPNeon)

- (void)ylp_neonMakeAlign:(void (NS_NOESCAPE ^)(id <YLPNeonAlignLayout> align))block;
- (void)ylp_neonMakeEdgeCorner:(void (NS_NOESCAPE ^)(id <YLPNeonCornerLayout> edgeCorner))block;

@end
