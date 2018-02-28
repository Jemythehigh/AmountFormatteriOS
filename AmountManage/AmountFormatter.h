//
//  AmountFormatter.h
//  AmountManage
//
//  Created by Gaurav Malviya on 08/02/18.
//  Copyright © 2018 Gaurav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AmountFormatter : NSObject

@property (strong, nonatomic) NSMutableString *originalInput;

- (NSString *)formatAmountInputOnCharacter:(NSString *)inputCharacter oldString:(NSString *)oldString;

@end
