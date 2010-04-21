//
//  Author.h
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Author : NSObject {
	NSString *authorId;
	NSString *firstName;
	NSString *lastName;
}

@property (nonatomic, retain) NSString *authorId;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;

@property (nonatomic, readonly) NSString *fullName;

@end
