//
//  LXChatMessageTextCell.m
//  LXChatDemo
//
//  Created by Lai on 2019/7/9.
//  Copyright © 2019 manman. All rights reserved.
//

#import "LXChatMessageTextCell.h"
@interface LXChatMessageTextCell()

@end
@implementation LXChatMessageTextCell
-(void)setup{
    [super setup];
    [self.messageContentV addSubview:self.messageLabel];
}
-(void)configureCellWithData:(LXChatModel *)chatModel{
    [super configureCellWithData:chatModel];

    self.messageLabel.text = chatModel.content;
}
-(void)configSubViews{
    [super configSubViews];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}
-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel =[[UILabel alloc]init];
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}
@end
