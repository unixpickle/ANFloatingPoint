//
//  main.m
//  ANFloatingPoint
//
//  Created by Alex Nichol on 12/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANFloatingPoint.h"

#define BOOLTOSTR(x) (x ? @"YES" : @"NO")

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        double original = 9999999999999990;
        ANFloatingPoint * floating = [[ANFloatingPoint alloc] initWithDouble:original];
        NSData * encoded = [floating packedData];
        ANFloatingPoint * decoded = [[ANFloatingPoint alloc] initWithPacked:encoded];
        
        NSLog(@"isinf() = %@, isnan() = %@", BOOLTOSTR([decoded isInfinity]), BOOLTOSTR([decoded isNan]));
        NSLog(@"Float = %1.15lf, Should be: %1.15lf", [decoded doubleValue], original);
    }
    return 0;
}

