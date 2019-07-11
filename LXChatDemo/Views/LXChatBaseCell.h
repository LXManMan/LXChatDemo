//
//  LXChatBaseCell.h
//  LXChatDemo
//
//  Created by Lai on 2019/7/9.
//  Copyright © 2019 manman. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LXChatModel.h"

@interface LXChatBaseCell : UITableViewCell
@property (nonatomic, strong) UIImageView *icon;//!<头像
@property (nonatomic, strong) UILabel *nickNameLabel;//!<昵称
@property (nonatomic, strong) UIView *messageContentV;//!<消息文本容器
@property (nonatomic, strong) LXChatModel *chatModel;
-(void)setup;
-(void)configSubViews;
- (void)configureCellWithData:(LXChatModel *)chatModel;
@end


