//
//  Candy.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/22/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Candy : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * latitude;

@end
