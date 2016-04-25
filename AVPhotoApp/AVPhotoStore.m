//
//  AVPhotoStore.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/22/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>

#import "AVPhotoStore.h"
#import "AVAPIManager.h"

@interface AVPhotoStore()

@property (nonatomic, strong) NSMutableArray *photos;

@end


@implementation AVPhotoStore

+ (AVPhotoStore *)sharedPhotoStore {
    
    static AVPhotoStore *sharedPhotoStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPhotoStore = [[AVPhotoStore alloc] init];
    });
    return sharedPhotoStore;
}


- (void)fetchPhotos:(void (^)(NSMutableArray<AVPhoto *> *photos))completion {
    
    self.photos = [[NSMutableArray alloc] init];

    [AVAPIManager getPhotoImageData:^(id response, NSError *error) {
        
        for (NSDictionary *dict in response) {
           
            AVPhoto *photo = [[AVPhoto alloc] init];
            
            NSString *imageName = dict[@"imageName"];
            NSString *imageDescription = dict[@"imageDescription"];
            NSString *imageURLString = dict[@"imageURL"];
            NSURL *imageURL = dict[@"imageURL"];
            
            photo.imageName = imageName;
            photo.imageDescription = imageDescription;
            photo.imageURLString = imageURLString;
            photo.imageURL = imageURL; 

            [self.photos addObject:photo];
        }
        
        completion(self.photos);
   
    }];
}


- (NSInteger)numberOfPhotos {
    return self.photos.count;
}


- (NSInteger)indexOfPhoto:(AVPhoto *)photo {
    NSInteger index = [self.photos indexOfObject:photo];
    return index; 
}


- (AVPhoto *)getPhotoAtIndex:(NSInteger)index {
    AVPhoto *photo = [self.photos objectAtIndex:index];
    return photo;
}

- (void)removePhotoAtIndex:(NSInteger)index {
    [self.photos removeObjectAtIndex:index];
//    should  fire the notification to view controllers, VCs should listen for that notification and reload their data
}


- (void)notify {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AVPhotoStoreDidChangeNotification" object:self];
}


- (void)handleNotification:(NSNotification *)notification {

}


@end