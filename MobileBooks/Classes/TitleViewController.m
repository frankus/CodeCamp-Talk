//
//  TitleViewController.m
//  MobileBooks
//
//  Created by Frank Schmitt on 2010-04-14.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import "TitleViewController.h"


@implementation TitleViewController

@synthesize bookTitle, titleTextField, delegate;

- (id)initWithTitle:(NSString *)title_param delegate:(id <TitleViewControllerDelegate>)delegate_param {
	if (self = [super initWithNibName:@"TitleViewController" bundle:nil]) {
		self.bookTitle = title_param;
		self.delegate = delegate_param;
	}
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = @"Edit Title";
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];

	self.titleTextField.text = self.bookTitle;
	[self.titleTextField becomeFirstResponder];
}

- (void)cancel {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)done {
	[delegate titleChangedTo:self.titleTextField.text];
	
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [super viewDidUnload];

	self.bookTitle = nil;
	self.titleTextField = nil;
}

- (void)dealloc {
	[bookTitle release];
	
	[titleTextField release];
	
    [super dealloc];
}

@end
