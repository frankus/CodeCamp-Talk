//
//  TitleViewController.h
//  MobileBooks
//
//  Created by Frank Schmitt on 2010-04-14.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleViewControllerDelegate.h"

@interface TitleViewController : UIViewController <UITextFieldDelegate> {
	NSString *bookTitle;
	
	id <TitleViewControllerDelegate> delegate;
	
	UITextField *titleTextField;
}

@property (nonatomic, retain) NSString *bookTitle;
@property (nonatomic, assign) id <TitleViewControllerDelegate> delegate;

@property (nonatomic, retain) IBOutlet UITextField *titleTextField;

- (id)initWithTitle:(NSString *)title delegate:(id <TitleViewControllerDelegate>)delegate;
- (void)cancel;
- (void)done;

@end
