//
//  BBBreed.m
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBBreed.h"

@implementation BBBreed

- (BBBreed *)initWithName:(NSString *)name subbreeds:(NSArray *)subbreed imageURLs:(nonnull NSArray *)imageURLs
{
    self = [super init];
    if (self)
    {
        _name = name;
        _subbreeds = subbreed;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
