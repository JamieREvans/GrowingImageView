//
//  GrowingImageView.h
//  GrowingImageView
//
//  Created by Jamie Evans on 2015-07-30.
//  Copyright (c) 2015 JamieREvans. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GrowthType)
{
    GrowthTypeExpand, // Horizontal and vertical growth
    GrowthTypeVertical, // Vertical growth
    GrowthTypeHorizontal, // Horizontal growth (reveals content above image view)
    GrowthTypeHorizontalStationary, // Horizontal growth and y translation (reveals content below image view)
    GrowthTypeHybrid // Vertical growth and logarithmic horizontal growth
};

@interface GrowingImageView : UIImageView <UIScrollViewDelegate>

@property (nonatomic) GrowthType GrowthType;

/**
 *
 * This method will grow the image view based on the scroll view's y content offset. You do not need to call this method if you make this view the UIScrollView's delegate.
 * 
 * @param yOffset The scroll view's current yOffset - taken from `scrollViewDidScroll:`
 *
 */
- (void)scrollViewScrolledToYOffset:(CGFloat)yOffset;

@end

@interface UIView (Growing)

/**
 *
 * This category is used by GrowingImageView so that any UIImageView subclass can use this method, but GrowingImageView acts as a wrapper for this.
 *
 * @param yOffset The scroll view's current yOffset - taken from `scrollViewDidScroll:`
 *
 * @param GrowthType The type of growth for the scrollview to use.
 */
- (void)growForYOffset:(CGFloat)yOffset withGrowthType:(GrowthType)GrowthType;

@end
