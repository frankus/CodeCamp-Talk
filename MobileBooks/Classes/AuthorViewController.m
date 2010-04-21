//
//  AuthorViewController.m
//  MobileBooks
//
//  Created by Frank Schmitt on 2010-04-14.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import "AuthorViewController.h"
#import "Author.h"
#import "ObjectiveResource.h"


@implementation AuthorViewController

@synthesize authorId, delegate, authors, previouslySelectedCell;

- (id)initWithAuthorId:(NSString *)authorId_param delegate:(id <AuthorViewControllerDelegate>)delegate_param {
	if (self = [super initWithNibName:@"AuthorViewController" bundle:nil]) {
		self.authorId = authorId_param;
		self.delegate = delegate_param;
	}
	
	return self;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Author";
 
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];

	self.authors = [Author findAllRemote];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [authors count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	Author *author = [authors objectAtIndex:indexPath.row];
	
	cell.textLabel.text = author.fullName;
	
	if ([author.authorId isEqualToString:authorId])
	{
		self.previouslySelectedCell = cell;
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	self.previouslySelectedCell.accessoryType = UITableViewCellAccessoryNone;
	[self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	self.previouslySelectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
	
	self.authorId = ((Author *)[authors objectAtIndex:indexPath.row]).authorId;
}


- (void)cancel {
	[self.navigationController popViewControllerAnimated:YES];
}


- (void)done {
	Author * author = [self.authors objectAtIndex:[self.tableView indexPathForCell:previouslySelectedCell].row];
	
	[delegate authorChangedTo:author];
	
	[self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload {
	self.authorId = nil;
	self.authors = nil;
}


- (void)dealloc {
	[authorId release];
    [authors release];
	
	[super dealloc];
}


@end

