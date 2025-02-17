//
//  BBBreed.h
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBSubbreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBBreed : NSObject

@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, copy, readonly)NSArray<BBSubbreed *> *subbreeds;
@property (nonatomic, copy)NSArray *imageURLs;

-(BBBreed *)initWithName:(NSString *)name
                subbreeds:(NSArray<NSString *> *)subbreeds
                imageURLs:(NSArray<NSString *> *)imageURLs;


@end

NS_ASSUME_NONNULL_END
