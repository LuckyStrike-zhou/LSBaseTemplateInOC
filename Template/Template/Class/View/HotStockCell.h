//
//  HotStockCell.h
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import "ZTBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HotStockCell : ZTBaseTableViewCell

/** <#注释#>  */
@property (nonatomic,copy) EmptyBlock cBlock;
/** <#注释#>  */
@property (nonatomic,strong) UILabel *nameLab;
/** <#注释#>  */
@property (nonatomic,strong) UILabel *codeLab;
/** <#注释#>  */
@property (nonatomic,strong) UILabel *priceLab;
/** <#注释#>  */
@property (nonatomic,strong) UILabel *zdfLab;

@end

NS_ASSUME_NONNULL_END
