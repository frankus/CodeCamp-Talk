//
//  RootViewController.h
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSArray *books;
}

@property (nonatomic, retain) NSArray *books;

-(void)newBook;

@end
