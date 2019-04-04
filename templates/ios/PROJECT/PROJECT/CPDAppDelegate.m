//
//  CPDAppDelegate.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CPDAppDelegate.h"
#import <CommunicationModule/CommunicationModule.h>
#import <Login/Login.h>

@implementation CPDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    id<IRACommunicationService> communication = [[[RALoginCoreModules sharedInstance] activated] communicationModule];
    id<IRACommunicationConfig> config = [[[RALoginCoreModules sharedInstance] activated] communicationConfig];
    // TODO: use plist
    [config setAppId:1000567];
    [config setDebugIp:@"140.207.54.35"];
    [config setUserTestServer:YES];
    [config setVersion:[self releaseVersionForOffline]];
    [config setQua:[self qua]];
    [communication initService:config];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - App Info

/**获取主版本编译号，用于给WNS对业务监控的关键字*/
- (NSString *)releaseVersion
{
    NSString* releaseVersion = [self releaseVersionForOffline];
    return [NSString stringWithFormat:@"IPH.%@",releaseVersion];
}

- (NSString *)releaseVersionForOffline
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildVersion
{
    NSString* bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    NSArray *bundleVerAry = [bundleVersion componentsSeparatedByString:@"."];
    return [bundleVerAry lastObject];
}

- (NSString*)qua
{
    NSString *qua = [NSString stringWithFormat:@"V1_IPH_%@_%@_%@_%@_B", @"abc", [self releaseVersionForOffline], [self buildVersion], @"RDM"];
    return qua;
}

@end
