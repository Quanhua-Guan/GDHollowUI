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
 不支持设置图片.
 */
@interface GDHollowButton : UIButton

@property (nonatomic, strong, nullable) NSAttributedString *attributeTitle;///< 标题, 和title属性相互影响
@property (nonatomic, strong, nullable) NSString *title;///< 标题, 和title属性相互影响
@property (nonatomic, strong, nullable) UIFont *font;///< 标题字体

@end

NS_ASSUME_NONNULL_END
