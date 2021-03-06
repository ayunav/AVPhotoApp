//
//  AVAPIManager.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AVAPIManager.h"

#define API_DATA_URL @"https://hinge-homework.s3.amazonaws.com/client/services/homework.json"


@implementation AVAPIManager

+ (void)getPhotoImageData:(void(^)(id response, NSError *error))completionHandler {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:API_DATA_URL
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          
             completionHandler(responseObject, nil);
         
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
             NSLog(@"%@", error);
         
         }];
}

@end
