//
//  PhotoCollectionViewCell.h
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface PhotoCollectionViewCell : UICollectionViewCell

/** 移除回调  */
@property (nonatomic,copy) EmptyBlock rBlock;
/**   */
@property (nonatomic,strong) UIImageView *img;
/** <#注释#>  */
@property (nonatomic,strong) UIButton *closeBtn;

- (void)configWithImg:(UIImage*)img;

@end

NS_ASSUME_NONNULL_END
