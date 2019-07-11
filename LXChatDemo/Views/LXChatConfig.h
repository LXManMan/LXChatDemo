//
//  LXChatConfig.h
//  LXChatDemo
//
//  Created by Lai on 2019/7/8.
//  Copyright © 2019 manman. All rights reserved.
//

#ifndef LXChatConfig_h
#define LXChatConfig_h

/**
 *  消息拥有者类型
 */
typedef NS_ENUM(NSUInteger, LXMessageOwner){
    LXMessageOwnerUnknown = 0 /**< 未知的消息拥有者 */,
    LXMessageOwnerSystem /**< 系统消息 */,
    LXMessageOwnerSelf /**< 自己发送的消息 */,
    LXMessageOwnerOther /**< 接收到的他人消息 */,
};
/**
*  消息类型
*/
typedef NS_ENUM(NSUInteger, LXMessageType){
    LXMessageTypeUnknow = 0 /**< 未知的消息类型 */,
    LXMessageTypeSystem /**< 系统消息 */,
    LXMessageTypeTime /**< 消息时间 */ ,
    LXMessageTypeText /**< 文本消息 */,
    LXMessageTypeImage /**< 图片消息 */,
    LXMessageTypeVoice /**< 语音消息 */
};

/**
 *  消息类型的key
 */
static NSString *const kLXMessageConfigurationTypeKey = @"kLXMessageConfigurationTypeKey";
/**
 *  消息拥有者的key
 */
static NSString *const kLXMNMessageConfigurationOwnerKey = @"kLXMNMessageConfigurationOwnerKey";


#endif /* LXChatConfig_h */
