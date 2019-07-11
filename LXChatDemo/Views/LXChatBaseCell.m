//
//  LXChatBaseCell.m
//  LXChatDemo
//
//  Created by Lai on 2019/7/9.
//  Copyright © 2019 manman. All rights reserved.
//

#import "LXChatBaseCell.h"

@implementation LXChatBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = 0;
        [self setup];
        [self configSubViews];
    }
    return self;
}
-(void)configSubViews{
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon);
        make.width.mas_lessThanOrEqualTo(120);
        make.height.mas_equalTo(14);
    }];
    
    [self.messageContentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH *0.6);
        make.bottom.mas_equalTo(-10);
        make.bottom.mas_greaterThanOrEqualTo(self.icon.mas_bottom);
    }];
    
}
- (void)configureCellWithData:(LXChatModel *)chatModel{
    self.chatModel = chatModel;
    self.nickNameLabel.text = chatModel.name;
    NSInteger type = [_chatModel.owerType integerValue];
    NSLog(@"%ld --%@",type,_chatModel.name);
    switch ([chatModel.owerType integerValue] ) {
        case LXMessageOwnerSelf:
        {
            self.icon.image = [UIImage imageNamed:@"boy"];
            [self.icon mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(16);
                make.top.mas_equalTo(10);
                make.width.mas_equalTo(40);
                make.height.mas_equalTo(40).with.priorityHigh();
            }];
            [self.nickNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.icon.mas_right).offset(5);
                make.top.mas_equalTo(self.icon);
                make.width.mas_lessThanOrEqualTo(120);
                make.height.mas_equalTo(14);
            }];
            [self.messageContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.nickNameLabel);
                make.top.mas_equalTo(self.nickNameLabel.mas_bottom);
                make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH *0.6);
                make.bottom.mas_equalTo(-10);
                make.bottom.mas_greaterThanOrEqualTo(self.icon.mas_bottom);
            }];
        }
            break;
        case LXMessageOwnerOther:
        {
            [self.icon mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-16);
                make.top.mas_equalTo(10);
                make.width.mas_equalTo(40);
                make.height.mas_equalTo(40).with.priorityHigh();
            }];
            [self.nickNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.icon.mas_left).offset(-5);
                make.top.mas_equalTo(self.icon);
                make.width.mas_lessThanOrEqualTo(120);
                make.height.mas_equalTo(14);
            }];
            [self.messageContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.nickNameLabel);
                make.top.mas_equalTo(self.nickNameLabel.mas_bottom);
                make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH *0.6);
                make.bottom.mas_equalTo(-10);
                make.bottom.mas_greaterThanOrEqualTo(self.icon.mas_bottom);
            }];
            self.icon.image = [UIImage imageNamed:@"girl"];
        }
            break;
        default:
            break;
    }
    [self.contentView updateConstraints];
    [self.contentView layoutIfNeeded];
}

-(void)setup{
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.nickNameLabel];
    [self.contentView addSubview:self.messageContentV];
}
-(UIImageView *)icon{
    if (!_icon) {
        _icon =[[UIImageView alloc]init];
        _icon.image = [UIImage imageNamed:@"boy"];
    }
    return _icon;
}
-(UILabel *)nickNameLabel{
    if (!_nickNameLabel) {
        _nickNameLabel =[[UILabel alloc]init];
        _nickNameLabel.textAlignment = NSTextAlignmentLeft;
        _nickNameLabel.font = Font(12);
        _nickNameLabel.text = @"昵称";
    }
    return _nickNameLabel;
}
-(UIView *)messageContentV{
    if (!_messageContentV) {
        _messageContentV =[[UIView alloc]init];
        _messageContentV.backgroundColor =[UIColor whiteColor];
    }
    return _messageContentV;
}

@end
