//
//  DetailViewController.h
//  MobileBooks
//
//  Created by Frank Schmitt on 2010-04-14.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleViewControllerDelegate.h"
#import "AuthorViewControllerDelegate.h"

@class Book;

@interface DetailViewController : UITableViewController <TitleViewControllerDelegate, AuthorViewControllerDelegate> {
	Book *book;
	
	UIBarButtonItem *backButtonItem;
}

@property (nonatomic, retain) Book *book;

@property (nonatomic, retain) UIBarButtonItem *backButtonItem;

@end
