//
//  AVAPIManager.h
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVPhotoImage.h"
#import "AVHomepageCollectionViewController.h"


@interface AVAPIManager : NSObject

+ (void)getPhotoImageData:(void(^)(id response, NSError *error))handler;

@end
