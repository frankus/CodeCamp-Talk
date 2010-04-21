//
//  Book.h
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Author;

@interface Book : NSObject {
	NSString *bookId;
	NSString *title;
	
	Author *author;
	NSString *authorId;
}

@property (nonatomic, retain) NSString *bookId;
@property (nonatomic, retain) NSString *title;

@property (nonatomic, retain) Author *author;
@property (nonatomic, retain) NSString *authorId;

@end
