//
//  AppDelegate.m
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "AppDelegate.h"
#import "BBBreedController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [[BBBreedController sharedInstance] fetchBreeds:^(NSArray<BBBreed *> * _Nonnull breeds) {
//    [BBBreedController.sharedInstance fetchBreeds:^(NSArray<BBBreed *> * _Nonnull breeds)
//    {
//
//
//
//        NSLog(@"%@", breeds);
//        BBBreed *breed = breeds[0];
//
//        [[BBBreedController sharedInstance] fetchBreedImageURL:breed completion:^(NSArray * _Nonnull imagesArray) {
//            NSLog(@"%@", breed);
//        }];
        return YES;
//    }];
//    [BBBreedController sharedInstance] fetchBreedImageURL:(@"hound") completion:^(NSArray * _Nonnull) {
//
//    }
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
