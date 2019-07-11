//
//  LXChatImageCell.m
//  LXChatDemo
//
//  Created by Lai on 2019/7/9.
//  Copyright © 2019 manman. All rights reserved.
//

#import "LXChatImageCell.h"
@interface LXChatImageCell()
@property (nonatomic, strong) UIImageView *contentImageView;
@end
@implementation LXChatImageCell

-(void)setup{
    [super setup];
    [self.messageContentV addSubview:self.contentImageView];
}
-(void)configureCellWithData:(LXChatModel *)chatModel{
    [super configureCellWithData:chatModel];
   
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:chatModel.links] placeholderImage:[UIImage imageNamed:@"占位图"] options:0];
    
}
-(void)configSubViews{
    [super configSubViews];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10).with.priorityHigh();
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(120, 120)).with.priorityHigh();
    }];
}
-(UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView =[[UIImageView alloc]init];
    }
    return _contentImageView;
}

@end
