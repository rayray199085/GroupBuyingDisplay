//
//  SCFooterView.h
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 9/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCFooterView;
NS_ASSUME_NONNULL_BEGIN
@protocol SCFooterViewDelegate <NSObject>
@required
-(void)footerViewDidLoadMoreItems:(SCFooterView *) footerView;
@end
@interface SCFooterView : UIView
@property(nonatomic,weak)id<SCFooterViewDelegate> delegate;
+(instancetype)footerView;
@end

NS_ASSUME_NONNULL_END
