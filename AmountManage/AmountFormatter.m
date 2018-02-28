//
//  AmountFormatter.m
//  AmountManage
//
//  Created by Gaurav Malviya on 08/02/18.
//  Copyright © 2018 Gaurav. All rights reserved.
//

#import "AmountFormatter.h"

@implementation AmountFormatter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.originalInput = [NSMutableString new];
    }
    return self;
}

- (NSString *)formatAmountInputOnCharacter:(NSString *)inputCharacter oldString:(NSString *)oldString  {
    
    if ([inputCharacter isEqualToString:@""] && (self.originalInput.length > 0)) {
        [self.originalInput deleteCharactersInRange:NSMakeRange([self.originalInput length]-1, 1)];
    }else
    {
        if (![self.originalInput isEqualToString:@"0"]) {
            [self.originalInput appendString:inputCharacter];
        }else
        {
            [self.originalInput deleteCharactersInRange:NSMakeRange([self.originalInput length]-1, 1)];
            return @"0.00";
        }
    }
    
    //4NSMutableString *formattedString = [NSMutableString new];
    if ([oldString isEqualToString:@"0"] && [self.originalInput isEqualToString:@"0"]) {
        return @"0.00";
    }else if (self.originalInput.length == 0)
    {
        return @"0.00";
    }else if (oldString.length == 0) {
        return [NSString stringWithFormat:@"0.0%@", inputCharacter];
        //return [NSString stringWithFormat:@"0"];
    }else
    {
        if (self.originalInput.length == 1) {
            return [NSString stringWithFormat:@"0.0%@", self.originalInput];
        }else if (self.originalInput.length == 2)
        {
            return [NSString stringWithFormat:@"0.%@", self.originalInput];
        }else
        {
            NSString *decimalString =  [self.originalInput substringFromIndex: [self.originalInput length] - 2];
            NSString *numberString =  [self.originalInput substringToIndex:[self.originalInput length] - 2];
            
            NSNumberFormatter *formatter = [NSNumberFormatter new];
            [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
            
            NSString *formatted = [formatter stringFromNumber:[NSNumber numberWithInteger:[numberString floatValue]]];
            
            
            return [NSString stringWithFormat:@"%@.%@", formatted, decimalString];
        }
        
        return [NSString stringWithFormat:@"0.0%@", inputCharacter];
    }
    return @"";
}

@end


