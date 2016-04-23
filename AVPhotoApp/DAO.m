//
//  DAO.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/22/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "DAO.h"
#import "AVAPIManager.h"


@interface DAO()

@property (nonatomic, strong) NSMutableArray *photos;

@end


@implementation DAO


+ (DAO *)sharedInstance {

    static DAO *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DAO alloc] init];
    });
    return sharedInstance;
    
}


- (void)setup {

    self.photos = [[NSMutableArray alloc] init];

    [self fetchAndParseApiData];
}


- (void)fetchAndParseApiData {
    
    [AVAPIManager getPhotoImageData:^(id response, NSError *error) {
        
        for (NSDictionary *dict in response) {
           
            AVPhoto *photo = [[AVPhoto alloc] init];
            
            NSString *imageName = dict[@"imageName"];
            NSString *imageDescription = dict[@"imageDescription"];
            NSString *imageURL = dict[@"imageURL"];
            
            photo.imageName = imageName;
            photo.imageDescription = imageDescription;
            photo.imageURL = imageURL;
            
            [self.photos addObject:photo];
        }
   
    }];
   
}


- (AVPhoto *)getPhotoAtIndex:(int)index {
    
    // get from photos array
    AVPhoto * v;
    return v;
}


@end
