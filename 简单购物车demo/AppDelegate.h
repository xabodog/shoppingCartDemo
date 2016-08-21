//
//  AppDelegate.h
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) NSString *databasePath;

-(void) createAndCheckDatabase;

@end

