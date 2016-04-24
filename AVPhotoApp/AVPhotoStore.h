//
//  AVPhotoStore.h
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/22/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVPhoto.h"

@interface AVPhotoStore : NSObject


+ (AVPhotoStore *)sharedPhotoStore;

- (void)fetchAndParseApiData:(void (^)(NSMutableArray<AVPhoto *> *photos))completion;

- (NSInteger)numberOfPhotos;
- (NSInteger)indexOfPhoto:(AVPhoto *)photo;
- (AVPhoto *)getPhotoAtIndex:(NSInteger)index;
- (void)removePhotoAtIndex:(NSInteger)index;

@end
