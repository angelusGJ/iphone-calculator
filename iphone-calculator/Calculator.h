//
//  Calculator.h
//  iphone-calculator
//
//  Created by Angel Garcia Jerez on 25/08/12.
//  Copyright (c) 2012 Angel Garcia Jerez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Calculator <NSObject>
- (NSNumber *) add:(NSNumber*)firstSummand secondSummand: (NSNumber *) secondSummand;
- (NSNumber *) multiply:(NSNumber*)firstFactor secondFactor: (NSNumber *) secondFactor;
- (NSNumber *) subtract:(NSNumber*)minuend subtrahend: (NSNumber *) subtrahend;
- (NSNumber *) divide:(NSNumber*)dividend divisor: (NSNumber *) divisor;
@end
