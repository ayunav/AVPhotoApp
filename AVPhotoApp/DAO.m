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


+ (DAO*)sharedInstance {

    static DAO *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DAO alloc] init];
    });
    return sharedInstance;
    
}


- (void)setup {

    self.photos = [[NSMutableArray alloc] init];

}


- (void)fetchAndParseApiData:(NSArray *)data {
    
    AVPhoto *photo = [[AVPhoto alloc]init];
    
    
    [AVAPIManager getPhotoImageData:^(id response, NSError *error) {
        
        
        for (NSDictionary *dict in data) {
            // parse
            AVPhoto * image = [[AVPhoto alloc] init];
            
            //
            //
            //
            
            [self.photos addObject:image];
        }
   
        
        
        
        //        photoImageObject.imageURL = self.photoImageObjects[@"imageURL"];
        //        photoImageObject.imageURL = self.photoImageObjects[@"imageURL"];
        //        photoImageObject.imageURL = self.photoImageObjects[@"imageURL"];
    }];
    
    

    
}


- (AVPhoto *)getPhotoAtIndex:(int)index {
    
    // get from photos array
    AVPhoto * v;
    return v;
}


@end
