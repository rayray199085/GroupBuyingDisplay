//
//  SCTableViewCell.h
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 9/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCGroupItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCTableViewCell : UITableViewCell
@property(nonatomic,strong)SCGroupItem *item;
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
