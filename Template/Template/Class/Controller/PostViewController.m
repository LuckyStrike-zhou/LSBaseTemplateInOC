//
//  PostViewController.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "PostViewController.h"
#import "BRPlaceholderTextView.h"
#import "LYFPhotosManager.h"
#import "PhotoCollectionViewCell.h"

static NSString *photoCell = @"photoCell";

@interface PostViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

/**   */
@property (nonatomic,strong) BRPlaceholderTextView *textField;

/** <#注释#>  */
@property (nonatomic,strong) UICollectionView *collView;

/** <#注释#>  */
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BRPlaceholderTextView *textField = [BRPlaceholderTextView new];
    textField.placeholder = @"分享您的心得~";
    [textField setPlaceholderColor:[UIColor lightGrayColor]];
    [textField setPlaceholderOpacity:0.8];
    textField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
    textField.clipsToBounds = YES;
    textField.layer.cornerRadius = 5;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(200);
    }];
    self.textField = textField;
    
    
    
    [self.collView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:photoCell];
    [self.view addSubview:self.collView];
    [self.collView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(20);
        make.left.right.equalTo(textField);
        make.height.mas_equalTo((SCREEN_WIDTH - 20)/3.);
    }];
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collView.mas_bottom).offset(100);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(80);
        make.right.equalTo(self.view).offset(-80);
        make.height.mas_equalTo(40);
    }];
    
    [self.dataSource addObject:UIImageNamed(@"AddImageOutlined")];
}

- (void)submit{
    if (self.textField.text.length > 0) {
        [Tools hudWithText:@"发布成功" on:self.view];
    }
}

- (void)openPhoto{
    WS;
    
    NSInteger maxCount = [self.dataSource containsObject:UIImageNamed(@"AddImageOutlined")] ? 3 : 3 - self.dataSource.count;
    [LYFPhotosManager showPhotosManager:self withMaxImageCount:maxCount withAlbumArray:^(NSMutableArray<LYFPhotoModel *> *albumArray) {
        
        if (albumArray.count > 0 && [self.dataSource containsObject:UIImageNamed(@"AddImageOutlined")]) {
            [weakSelf.dataSource removeObject:UIImageNamed(@"AddImageOutlined")];
        }
        
        for (LYFPhotoModel *model in albumArray) {
            [weakSelf.dataSource addObject:model.highDefinitionImage];
        }
        [weakSelf.collView reloadData];
    }];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCell forIndexPath:indexPath];
    [cell configWithImg:self.dataSource[indexPath.row]];
    WS;
    cell.rBlock = ^{
        if (weakSelf.dataSource.count > indexPath.row) {
            [weakSelf.dataSource removeObjectAtIndex:indexPath.row];
        }
        if (weakSelf.dataSource.count == 0) {
            [weakSelf.dataSource addObject:UIImageNamed(@"AddImageOutlined")];
//            [cell configWithImg:UIImageNamed(@"AddImageOutlined")];
        }
        [weakSelf.collView reloadData];
    };
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self openPhoto];
}

#pragma mark - getter

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (UICollectionView *)collView{
    if (!_collView) {
        CGFloat length = (SCREEN_WIDTH - 20 * 2)/3.;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(length, length);
        
        _collView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collView.dataSource = self;
        _collView.delegate = self;
        _collView.backgroundColor = [UIColor clearColor];
        _collView.scrollEnabled = NO;
    }
    return _collView;
}

@end
