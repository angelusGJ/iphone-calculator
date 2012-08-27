//
//  CalculatorAmazon.m
//  iphone-calculator
//
//  Created by Angel Garcia Jerez on 24/08/12.
//  Copyright (c) 2012 Angel Garcia Jerez. All rights reserved.
//

#import "CalculatorAmazon.h"


@implementation CalculatorAmazon

@synthesize comunicator;
@synthesize delegate;

-(id) initWithComunicator:(id<CalculatorComunicator>)newComunicator {

    NSParameterAssert(newComunicator);

    if (newComunicator && ![newComunicator conformsToProtocol:@protocol(CalculatorComunicator)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Comunicator objec does not conform the protocol CalculatorComunicator" userInfo:nil] raise];
    }
    
    
    if (self = [super init]) {
        comunicator = newComunicator;
        [comunicator setDelegate:self];
    }
    
    return self;
    
}

- (NSNumber *) add:(NSNumber *)firstSummand secondSummand:(NSNumber *)secondSummand {
    
    [comunicator fetchingResult:firstSummand secondOperand:secondSummand operator:ADD];
    
    return [NSNumber numberWithDouble:[firstSummand doubleValue] + [secondSummand doubleValue]];
}

- (NSNumber *) multiply:(NSNumber *)firstFactor secondFactor:(NSNumber *)secondFactor {
    
    [comunicator fetchingResult:firstFactor secondOperand:secondFactor operator:MULTIPLY];
    
    return [NSNumber numberWithDouble:[firstFactor doubleValue] * [secondFactor doubleValue]];
}

- (NSNumber *) subtract:(NSNumber *)minuend subtrahend:(NSNumber *)subtrahend {
    
    [comunicator fetchingResult:minuend secondOperand:subtrahend operator:SUBSTRACT];
    
    return [NSNumber numberWithDouble:[minuend doubleValue] - [subtrahend doubleValue]];
}

- (NSNumber *)divide:(NSNumber *)dividend divisor:(NSNumber *)divisor {
    [comunicator fetchingResult:dividend secondOperand:divisor operator:DIVIDE];
    
    return [NSNumber numberWithDouble:[dividend doubleValue] / [divisor doubleValue]];
}

#pragma Deletegate AmazonComunicator

- (void)resultOperationFailedWithError:(NSError *)error {
    [delegate didFinishOperationWithError:error];
}

- (void)resultOperation:(NSString *)resultJSON {
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    
    [formater setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [delegate didFinishOperation: [formater numberFromString:resultJSON]];
}
@end
        