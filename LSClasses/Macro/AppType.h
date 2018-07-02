//
//  AppType.h
//  TimeHomeApp
//
//  Created by us on 16/1/4.
//  Copyright © 2016年 石家庄优思交通智能科技有限公司. All rights reserved.
//
/**
 定义新类型或枚举，所有新类型或枚举都在此定义
 **/
#ifndef AppType_h
#define AppType_h
//-----------------------枚举类型--------------------------------
//设备类型
//设备分类：-2 高清摄像头 -1 红外1 开关 2 多路开关 3 机械手类(31 窗帘 32 机械臂) 4 亮度调节类() 5 传感器() 6 报警类设备(61 红外报警器 62烟雾报警器 63 燃气报警器) 100电视遥控 101空调遥控

typedef enum
{
    ///高清摄像头
    DEVCamera=-2,
    ///红外
    DEVInfrared=-1,
    ///开关
    DEVSwith=1,
    ///多路开关
    DEVMultiwaySwitch=2,
    ///窗帘
    DEVCurtain=31,
    ///机械臂
    DEVManipulator=32,
    ///亮度调节类
    DEVBrightness=4,
    ///温湿度传感器
    DEVWenShi=51,
    ///温湿光传感器
    DEVWenShiGuang=52,
    ///红外报警器
    DEVInfraredAlarm=61,
    ///烟雾报警器
    DEVSmokeAlarm=62,
    ///燃气报警器
    DEVGasAlarm=63,
    ///电视遥控
    DEVTVRemoteControl=100,
    ///空调遥控
    DEVKongTiaoControl=101,
    ///扫地机器人遥控
    DEVSweepRobotControl=102,
    
}DevType;


//处理事件返回码
typedef NS_ENUM(NSInteger,ResultCode)
{
    ///事件处理成功
    SucceedCode=0,
    ///事件处理失败
    FailureCode,
    ///无网络环境
    NONetWorkCode,
    ///登录失效
    TOKENInvalid,
    ///自定义
    CustomCode,
};

//网络错误码
typedef NS_ENUM(NSInteger,NETWorkErrorCode)
{
    ///没有数据
    NETNothingData=-2,
    ///Token失效 -1
    NETTokenInvalidErrorCode,
    ///服务器响应错误 0
    NETServerErrorCode,
    ///网络响应成功 1
    NETSucceedErrorCode,
    ///网络无数据返回 2
    NETNoDataErrorCode,
    ///无网络 3
    NETNoWorkErrorCode,
    ///网络连接错误处理 4
    NETConnErrorCode,
    ///httpcode错误处理500,404等 5
    NETHttpCodeErrorCode,
};
///蓝牙事件处理码
typedef NS_ENUM(NSInteger,BluetoothCode)
{
    ///搜索蓝牙
    SearchBluetooth=1000,
    ///连接蓝牙
    ConntectBluetooth,
    ///蓝牙状态
    BluetoothState,
    ///发送指令
    SendCommd,
    ///打开成功
    OpenOk,
    ///设置密码
    OpenPWD,
    ///设置名称
    OpenName,
    ///打开失败
    OpenError,
    ///没有设备权限
    NOAuthorize,
    ///没找到设备
    NoFindDev,
    ///找到的设备信息
    DevInfo,
    ///蓝牙连接成功
    Successful,
    ///蓝牙连接失败
    Failure,
    ///蓝牙操作成功
    OperationOk,
    ///蓝牙操作失败
    OperationError,
    ///状态查询成功
    InquireOK,
    ///状态查询失败
    InquireError,
    ///断开连接
    Disconnect,
    ///停止搜索
    Stopsearch,
};



//-----------------------闭包块类型--------------------------------
/**
 *  网络请求完成后调用的Block
 */
//typedef void (^NetCompleteBlock)(NSURLResponse *response,
//                                 NSData *data,
//                                 NSError *connectionError);//异步完成调用

/**
 *  网络请求完成后调用的Block
 *
 *  @param data     data 处理后数据回传
 *  @param response response 返回响应对象
 *  @param error    error 处理过程中发生的错误信息
 */
typedef void (^TaskCompleteBlock)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

/**
 *  命令执行结果完成后返回结果
 *
 *  @param data       data 处理后数据回传
 *  @param resultCode resultCode 处理成功或失败码
 *  @param Error      Error 处理过程中发生的错误信息
 */
typedef void (^CommandCompleteBlock)(id  _Nullable data,ResultCode resultCode,NSError * _Nullable Error);

/**
 *  命令执行结果完成后更新Views
 *
 *  @param data       data 处理后数据回传
 *  @param resultCode resultCode 处理成功或失败码
 */
typedef void (^UpDateViewsBlock)(id  _Nullable data,ResultCode resultCode);


/**
 *  视图事件回调
 *
 *  @param data  data 回传数据
 *  @param view  view 处发事件iew
 *  @param index index 处发事件索引或列表索引
 */
typedef void (^ViewsEventBlock)(id _Nullable data,UIView *_Nullable view,NSInteger index);

/**
 *  列表视图事件回调
 *
 *  @param data  data 回传数据
 *  @param view  view 处发事件iew
 *  @param index index 处发事件索引或列表索引
 */
typedef void (^CellEventBlock)(id _Nullable data,UIView *_Nullable view,NSIndexPath *_Nullable index);
/**
 *  @param data       data 处理后数据回传
 *  @param bluetoothCode bluetoothCode 处理事件码
 */
typedef void (^BluetoothEventBlock)(id  _Nullable data,BluetoothCode bluetoothCode);
///弹框点击事件处理回调
typedef void (^AlertBlock)(NSInteger type);

#endif /* AppType_h */
