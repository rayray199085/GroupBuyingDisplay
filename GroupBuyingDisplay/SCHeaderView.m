//
//  SCHeaderView.m
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCHeaderView.h"
@interface SCHeaderView()
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UILabel *headViewTitle;
@property (weak, nonatomic) IBOutlet UIPageControl *pageIndicator;
@property(nonatomic,strong)NSTimer *timer;
-(void)addImage2ScrollView;
-(void)setNextPageImage:(int)index;
-(NSTimer *)createATimer;
@end
@implementation SCHeaderView
+(instancetype)headerView{
    return [[[NSBundle mainBundle]loadNibNamed:@"SCHeaderView" owner:nil options:nil]lastObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self addImage2ScrollView];
    self.imageScrollView.delegate = self;
    self.imageScrollView.pagingEnabled = YES;
    self.imageScrollView.showsHorizontalScrollIndicator = NO;
    self.pageIndicator.numberOfPages = 5;
    self.pageIndicator.currentPage = 0;
    self.timer = [self createATimer];
    
}
-(void)addImage2ScrollView{
    CGFloat imageWidth = self.imageScrollView.frame.size.width;
    CGFloat imageHeight = self.imageScrollView.frame.size.height;
    for(int i = 0; i < 5; i++){
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * imageWidth, 0, imageWidth, imageHeight);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_0%d",i]];
        [self.imageScrollView addSubview:imageView];
    }
    self.imageScrollView.contentSize = CGSizeMake(imageWidth * 5, 0);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if(self.timer!=nil){
        [self.timer invalidate];
    }
    self.timer = nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageIndicator.currentPage = (int) round(scrollView.contentOffset.x / scrollView.frame.size.width);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(self.timer == nil){
        self.timer = [self createATimer];
    }
}
-(void)setNextPageImage:(int)index{
    [self.imageScrollView setContentOffset:CGPointMake(index * self.imageScrollView.frame.size.width, 0) animated:YES];
}

-(NSTimer *)createATimer{
    NSTimer *timer  = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        int index = (int)self.pageIndicator.currentPage;
        if(index++ < 4){
            self.pageIndicator.currentPage = index;
        }else{
            index = 0;
            self.pageIndicator.currentPage = index;
        }
        [self setNextPageImage:index];
    }];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}
@end
