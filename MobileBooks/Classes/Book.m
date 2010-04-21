//
//  Book.m
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Book.h"
#import	"ObjectiveResource.h";

@implementation Book

@synthesize bookId, title, author, authorId;

- (NSArray *)excludedPropertyNames {
	return [[super excludedPropertyNames] arrayByAddingObject:@"author"];
}

- (void) dealloc {
	[bookId release];
	[title release];
	[author release];
	[authorId release];
	
	[super dealloc];
}

@end
