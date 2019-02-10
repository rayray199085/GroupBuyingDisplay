//
//  SCGroupItem.h
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 9/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCGroupItem : UIView
@property(nonatomic,copy)NSString *buyCount;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *title;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)groupItemWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
