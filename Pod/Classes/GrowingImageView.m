//
//  GrowingImageView.m
//  GrowingImageView
//
//  Created by Jamie Evans on 2015-07-30.
//  Copyright (c) 2015 JamieREvans. All rights reserved.
//

#import "GrowingImageView.h"

@implementation GrowingImageView

- (void)scrollViewScrolledToYOffset:(CGFloat)yOffset
{
    [self growForYOffset:yOffset withGrowthType:self.GrowthType];
}

#pragma mark - Scroll View Delegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self scrollViewScrolledToYOffset:scrollView.contentOffset.y];
}

@end

@implementation UIView (Growing)

- (CGFloat)horizontalTranslationForScale:(CGFloat)scale
{
    return CGRectGetWidth(self.bounds) * (1.0 - scale)/4.0;
}

- (void)growForYOffset:(CGFloat)yOffset withGrowthType:(GrowthType)GrowthType
{
    if(yOffset >= 0.0)
    {
        if(!CATransform3DEqualToTransform(self.layer.transform, CATransform3DIdentity))
        {
            [self.layer setTransform:CATransform3DIdentity];
        }
    }
    else
    {
        CGFloat naturalViewHeight = CGRectGetHeight(self.bounds);
        CGFloat newScale = 1.0 - ((yOffset / naturalViewHeight) * 2.0);
        CGFloat horizontalTranslation = [self horizontalTranslationForScale:newScale];
        CGFloat horizontalScale = 1.0;
        CGFloat verticalTranslation = 0.0;
        CGFloat verticalScale = 1.0;
        switch(GrowthType)
        {
            case GrowthTypeExpand:
                horizontalScale = verticalScale = newScale;
                break;

            case GrowthTypeVertical:
                verticalScale = newScale;
                horizontalTranslation = 0.0;
                break;

            case GrowthTypeHorizontal:
                horizontalScale = newScale;
                break;

            case GrowthTypeHorizontalStationary:
                verticalTranslation = (1.0 - newScale)/2.0 * naturalViewHeight;
                horizontalScale = newScale;
                break;

            case GrowthTypeHybrid:
                verticalScale = newScale;
                horizontalScale = sqrt(newScale);
                horizontalTranslation = [self horizontalTranslationForScale:horizontalScale];
                break;
        }

        CATransform3D scaleTransform = CATransform3DMakeScale(horizontalScale, verticalScale, 0.0);
        if(horizontalTranslation || verticalTranslation)
        {
            [self.layer setTransform:CATransform3DConcat(scaleTransform, CATransform3DMakeTranslation(horizontalTranslation, verticalTranslation, 0.0))];
        }
        else
        {
            [self.layer setTransform:scaleTransform];
        }
    }
}

@end
