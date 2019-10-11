//
//  BBBreedController.m
//  Dogs-C
//
//  Created by Bethany Wride on 10/9/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBBreedController.h"
#import "BBBreed.h"
#import "BBSubbreed.h"

static NSString *const kfetchBreedsBaseURLString = @"https://dog.ceo/api/breeds/list/all";
static NSString *const kfetchImageBreedBaseURLString = @"https://dog.ceo/api/breed";
static NSString *const kbreedImagesComponent = @"images";

@implementation BBBreedController 

+ (instancetype)sharedInstance
{
    static BBBreedController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [BBBreedController new];
    });
    return sharedInstance;
}

-(void)fetchBreeds:(void (^)(NSArray<BBBreed *> * _Nonnull))completion
{
    NSURL *finalURL = [NSURL URLWithString:kfetchBreedsBaseURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error fetching breeds from search term: %@", error);
            completion(@[]);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error)
            {
                NSLog(@"Error parsing data: %@", error.localizedDescription);
                completion(@[]);
                return;
            }
            NSDictionary *messageDictionary = topLevelDictionary[@"message"];
            NSMutableArray *arrayOfBreeds = [NSMutableArray new];
            for (id key in messageDictionary)
            {
                NSMutableArray *arrayofSubbreeds = [NSMutableArray new];
                for (NSString *name in messageDictionary[key])
                {
                    BBSubbreed *subbreed = [[BBSubbreed alloc] initWithName:name imageURLs:[NSMutableArray new]];
                    [arrayofSubbreeds addObject:subbreed];
                }
                BBBreed *breed = [[BBBreed alloc] initWithName:key subbreeds:arrayofSubbreeds imageURLs:[NSMutableArray new]];
                
                [arrayOfBreeds addObject:breed];
            }
            completion(arrayOfBreeds);
        }
    }]resume];
} // End of function

- (void)fetchBreedImageURL:(BBBreed *)breed completion:(void (^)(NSArray * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:kfetchImageBreedBaseURLString];
    NSURL *breedURL = [baseURL URLByAppendingPathComponent:breed.name];
    NSURL *finalURL = [breedURL URLByAppendingPathComponent:kbreedImagesComponent];

    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error)
            {
                NSLog(@"%@", error);
                completion(@[]);
                return;
            }
            NSMutableArray *imageArray = imageDictionary[@"message"];
            completion(imageArray);
        }
    }]resume];
} // End of funtion

- (void)fetchSubbreedImageURL:(BBSubbreed *)subbreed breed:(BBBreed *)breed completion:(void (^)(NSArray * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:kfetchImageBreedBaseURLString];
    NSURL *breedURL = [baseURL URLByAppendingPathComponent:breed.name];
    NSURL *subbreedURL = [breedURL URLByAppendingPathComponent:subbreed.name];
    NSURL *finalURL = [subbreedURL URLByAppendingPathComponent:kbreedImagesComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error)
            {
                NSLog(@"%@", error);
                completion(@[]);
                return;
            }
            NSMutableArray *imageArray = imageDictionary[@"message"];
            completion(imageArray);
        }
    }]resume];
} // End of funtion

- (void)fetchImageDataFromURL:(NSURL *)url completion:(void (^)(NSData * _Nullable))completion
{
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            completion(data);
        }
    }]resume];
}
@end
