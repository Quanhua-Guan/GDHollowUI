//
//  GDHollowButton.h
//  GDHollowUI
//
//  Created by Guan on 2019/1/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 文字镂空按钮
 可以设置背景颜色, 标题镂空效果, 所以背景色设为透明就啥也看不到了.
 - 不支持设置图片.
 - 不支持NSAttributedString标题
 */
@interface GDHollowButton : UIButton

@property (nonatomic, assign) NSTextAlignment titleAlignment;///< 水平方向上,标题的对齐方式

@end

NS_ASSUME_NONNULL_END
