//
//  AuthorViewController.h
//  MobileBooks
//
//  Created by Frank Schmitt on 2010-04-14.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorViewControllerDelegate.h"

@interface AuthorViewController : UITableViewController {
	NSString *authorId;
	
	id <AuthorViewControllerDelegate> delegate;
	
	NSArray *authors;
	NSString *selectedAuthorId;
	
	UITableViewCell *previouslySelectedCell;
}

@property (nonatomic, retain) NSString *authorId;
@property (nonatomic, assign) id <AuthorViewControllerDelegate> delegate;
@property (nonatomic, retain) NSArray *authors;
@property (nonatomic, assign) UITableViewCell *previouslySelectedCell;

- (id)initWithAuthorId:(NSString *)authorId_param delegate:(id <AuthorViewControllerDelegate>)delegate_param;
- (void)cancel;
- (void)done;

@end
