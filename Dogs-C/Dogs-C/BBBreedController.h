//
//  BBBreedController.h
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBBreedController : NSObject

+(instancetype)sharedInstance;

-(void)fetchBreeds:(void (^)(NSArray<BBBreed *> *breeds))completion;

-(void)fetchBreedImageURL:(BBBreed *)breed completion:(void (^) (NSArray *))completion;

-(void)fetchSubbreedImageURL:(void (^)(NSString *))completion;

-(void)fetchImageData:(void (^)(NSData *))completion;

@end

NS_ASSUME_NONNULL_END
