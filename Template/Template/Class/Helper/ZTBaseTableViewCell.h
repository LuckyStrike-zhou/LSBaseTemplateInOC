//
//  ZTBaseTableViewCell.h
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTBaseTableViewCell : UITableViewCell

/**   */
@property (nonatomic,strong) UIImageView *iconImg;
/** <#注释#>  */
@property (nonatomic,strong) UILabel *titleLab;

/** <#注释#>  */
@property (nonatomic,strong) id model;

- (void)configWithModel:(id)model;
- (void)setup;
@end

NS_ASSUME_NONNULL_END
