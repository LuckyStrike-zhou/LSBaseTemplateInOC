//
//  MarketModel.h
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarketModel : NSObject

/** <#注释#>  */
@property (nonatomic,copy) NSString *stockid;
/** <#注释#>  */
@property (nonatomic,copy) NSString *choose_date;
/** <#注释#>  */
@property (nonatomic,copy) NSString *price;
/** <#注释#>  */
@property (nonatomic,copy) NSString *chg;
/** <#注释#>  */
@property (nonatomic,copy) NSString *cn_name;
/** <#注释#>  */
@property (nonatomic,copy) NSArray *tags;

@end

NS_ASSUME_NONNULL_END
