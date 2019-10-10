//
//  BBSubbreed.m
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBSubbreed.h"

@implementation BBSubbreed

- (BBSubbreed *)initWithName:(NSString *)name imageURLs:(NSArray *)imageURLs
{
    self = [super init];
    if (self)
    {
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
