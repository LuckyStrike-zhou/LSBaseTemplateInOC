//
//  QAModel.h
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QAModel : NSObject

/** <#注释#>  */
@property (nonatomic,copy) NSString *code;
/** <#注释#>  */
@property (nonatomic,copy) NSString *codeName;
/** <#注释#>  */
@property (nonatomic,copy) NSString *question;
/** <#注释#>  */
@property (nonatomic,copy) NSString *answer;
/** <#注释#>  */
@property (nonatomic,copy) NSString *questiondate;
/** <#注释#>  */
@property (nonatomic,copy) NSString *answerdate;
/** <#注释#>  */
@property (nonatomic,copy) NSString *logo;

@end

NS_ASSUME_NONNULL_END
