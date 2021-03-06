//
//  AVGalleryViewController.h
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVPhoto.h"
#import "AVPhotoStore.h"


@interface AVGalleryViewController : UIViewController

@property (nonatomic) AVPhoto *photo;
@property (nonatomic) NSMutableArray *imageArray;

@end
