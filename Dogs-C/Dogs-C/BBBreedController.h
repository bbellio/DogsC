//
//  BBBreedController.h
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBBreed.h"
#import "BBSubbreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBBreedController : NSObject

+(instancetype)sharedInstance;

@property(nonatomic, copy)NSArray<BBBreed *> *breeds;
@property(nonatomic, copy)NSArray<BBSubbreed *> *subbreeds;

-(void)fetchBreeds:(void (^)(NSArray<BBBreed *> *breeds))completion;

-(void)fetchBreedImageURL:(BBBreed *)breed
               completion:(void (^)(NSArray *imagesArray))completion;

-(void)fetchSubbreedImageURL:(BBSubbreed *)subbreed
                       breed:(BBBreed *)breed
                  completion:(void (^)(NSArray *imagesArray))completion;
// _Nullable inside method; nullable for properties
-(void)fetchImageDataFromURL:(NSURL *)url
                  completion:(void (^)(NSData * _Nullable imageData))completion;

@end

NS_ASSUME_NONNULL_END
