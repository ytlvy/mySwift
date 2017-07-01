//
//  YLPNeonLayout.h
//  YLPNeon
//
//  Created by Peter on 07/06/2017.
//  Copyright © 2017 iastrolien. All rights reserved.
//

#import "YLPNeonUtilities.h"
#import "YLPNeonLayoutProtocol.h"

@interface YLPNeon : NSObject

@property (nonatomic, strong)  YLPNeonViewConstraint *constraint;

- (instancetype)initWithView:(YLPNeon_View *)view;
- (void)installNeon;

@end

@interface YLPNeonAlign : YLPNeon <YLPNeonAlignLayout>

@end

@interface YLPNeonEdgeCorner : YLPNeon <YLPNeonCornerLayout>

@end
