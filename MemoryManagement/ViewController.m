//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init]; // array now has a retain count of 1

    for (NSInteger index = 0; index < 10; index += 1) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting value"]; // also has a retain count of 1

        [array addObject:string]; // string now has a retain count of 2 becaue array is also responsible for it

        [string release]; // this releases it from our ownership but does not deallocate it yet
    }

    NSMutableString *firstString = [array objectAtIndex:0]; // we're not responsible for this string -> this is a new reference (pointer) to an object already in memory
    [firstString retain];
    NSLog(@"The string is: %@", firstString);
    [array release]; // do this before putting code inbetween init and here

    NSLog(@"The string is still: %@", firstString);
    [firstString release];
    NSLog(@"Hi");

    Person *me = [[Person alloc] init];

    NSMutableString *make = [[NSMutableString alloc] initWithString:@"Civic Si"];
    Car *honda = [[Car alloc] initWithMake:make];
    [make release];
    
    me.car = honda;
    [honda release];
//
//    NSLog(@"The make for my car is: %@", me.car.make);
//    [make replaceOccurrencesOfString:@"Si" withString:@"Sport" options:0 range:NSMakeRange(0, make.length)];
    NSLog(@"The make for my car is: %@", me.car.make);
    [me release];

}


@end
