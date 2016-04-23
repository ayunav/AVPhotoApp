//
//  DAO.h
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/22/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVPhoto.h"

@interface DAO : NSObject

+ (DAO *)sharedInstance;
- (AVPhoto *)getPhotoAtIndex:(int)index;

@end
