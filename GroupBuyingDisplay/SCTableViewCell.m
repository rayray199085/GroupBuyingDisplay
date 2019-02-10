//
//  SCTableViewCell.m
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 9/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCTableViewCell.h"
@interface SCTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;
@end
@implementation SCTableViewCell
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"group_item";
    SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[NSBundle mainBundle]loadNibNamed:@"SCTableViewCell" owner:nil options:nil].lastObject;
    }
    return cell;
}
- (void)setItem:(SCGroupItem *)item{
    _item = item;
    self.imageViewIcon.image = [UIImage imageNamed:item.icon];
    self.title.text = item.title;
    self.price.text = [NSString stringWithFormat:@"$%@",item.price];
    self.buyCount.text = [NSString stringWithFormat:@"%@ people bought",item.buyCount];
}
    
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
