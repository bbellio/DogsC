//
//  BBSubbreed.h
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBSubbreed : NSObject

@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, copy, readonly)NSArray *imageURLs;

-(BBSubbreed *)initWithName:(NSString *)name
                  imageURLs:(NSArray<NSString *> *)imageURLs;

@end

NS_ASSUME_NONNULL_END
