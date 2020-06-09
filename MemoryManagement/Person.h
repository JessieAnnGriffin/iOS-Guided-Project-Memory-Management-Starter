//
//  Person.h
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Person : NSObject

// TODO: Establish ownership for the car
@property (nonatomic, retain) Car *car; // here 'reatin' is similar to the  'strong' keyword
// MRC: assign (default in MRC - aka weak), or retains (aka string, the default in ARC)

- (instancetype)initWithCar:(Car *)car;

@end
