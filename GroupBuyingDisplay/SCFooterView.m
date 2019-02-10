//
//  SCFooterView.m
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 9/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCFooterView.h"
@interface SCFooterView()
@property (weak, nonatomic) IBOutlet UIButton *loadMoreBtn;
@property (weak, nonatomic) IBOutlet UIView *loading;
- (IBAction)loadMore:(id)sender;
@end
@implementation SCFooterView

- (IBAction)loadMore:(id)sender {
    self.loadMoreBtn.hidden = YES;
    self.loading.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if([self.delegate respondsToSelector:@selector(footerViewDidLoadMoreItems:)]){
            [self.delegate footerViewDidLoadMoreItems:self];
        }
        self.loadMoreBtn.hidden = NO;
        self.loading.hidden = YES;
    });
}
+(instancetype)footerView{
    return [[[NSBundle mainBundle]loadNibNamed:@"SCFooterView" owner:nil options:nil]lastObject];
}
@end
