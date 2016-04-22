//
//  AVHomepageCollectionViewController.h
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "AVPhotoImage.h"
#import "AVHomepageCollectionViewCell.h"
#import "AVAPIManager.h"

@interface AVHomepageCollectionViewController : UICollectionViewController

// strong? copy? 
@property (nonatomic, copy) NSArray *photoImageObjects; //an array of dictionaries

@property (nonatomic) NSArray *imageURLArray;

@end
