//
//  Author.m
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Author.h"

@implementation Author

@synthesize authorId, firstName, lastName;

- (NSString *)fullName {
	return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void)dealloc {
	[authorId release];
	[firstName release];
	[lastName release];
	
	[super dealloc];
}

@end
