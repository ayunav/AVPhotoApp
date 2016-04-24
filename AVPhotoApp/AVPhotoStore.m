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

- (void)fetchAndParseApiData:(void (^)(NSMutableArray<AVPhoto *> *photos))completion {
    
    self.photos = [[NSMutableArray alloc] init];

    [AVAPIManager getPhotoImageData:^(id response, NSError *error) {
        
        for (NSDictionary *dict in response) {
           
            AVPhoto *photo = [[AVPhoto alloc] init];
            
            NSString *imageName = dict[@"imageName"];
            NSString *imageDescription = dict[@"imageDescription"];
            NSString *imageURL = dict[@"imageURL"];
            
            photo.imageName = imageName;
            photo.imageDescription = imageDescription;
            photo.imageURL = imageURL;

//            NSURL *URL = [NSURL URLWithString:photo.imageURL];
//            NSData *imageData = [NSData dataWithContentsOfURL:URL];
//            UIImage *image = [UIImage imageWithData:imageData];
//            
//            SDImageCache *sharedImageCache = [SDImageCache sharedImageCache];
//            [sharedImageCache storeImage:image forKey:photo.imageURL]; 
//             
            [self.photos addObject:photo];
        }
        
        completion(self.photos);
   
    }];
   
}


//- (AVPhoto *)getPhotoAtIndex:(int)index {
//    
//    // get from photos array
//    AVPhoto * v;
//    return v;
//}


@end
