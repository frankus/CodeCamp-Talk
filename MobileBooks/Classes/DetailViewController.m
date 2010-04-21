//
//  DetailViewController.m
//  MobileBooks
//
//  Created by Frank Schmitt on 2010-04-14.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import "DetailViewController.h"
#import "Book.h"
#import "Author.h"
#import "ObjectiveResource.h"
#import "TitleViewController.h"
#import "AuthorViewController.h"

@implementation DetailViewController

@synthesize book, backButtonItem;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
 
	self.title = @"Book Detail";
	
	if (book == nil)
		self.book = [[Book alloc] init];
	else
		self.book = [Book findRemote:book.bookId];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;	

	self.tableView.allowsSelection = NO;
	self.tableView.allowsSelectionDuringEditing = YES;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)setEditing:(BOOL)isEditing animated:(BOOL)isAnimated {
	[super setEditing:isEditing animated:isAnimated];
	
	if (isEditing) {
		self.backButtonItem = self.navigationItem.leftBarButtonItem;
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
	} else {
		self.navigationItem.leftBarButtonItem = self.backButtonItem;
		
		[book saveRemote];
	}

}

- (void)cancel {
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0)
		return @"Title";
	else
		return @"Author";
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if (indexPath.section == 0)
    	cell.textLabel.text = book.title;
	else
		cell.textLabel.text = book.author.fullName;
    
	cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleNone;
}


- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIViewController *controller;
	
	switch (indexPath.section) {
		case 0:
			controller = [[TitleViewController alloc] initWithTitle:book.title delegate:self];
			break;
		case 1:
			controller = [[AuthorViewController alloc] initWithAuthorId:book.authorId delegate:self];
			break;
	}
	
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

#pragma mark -
#pragma mark TitleViewController delegate

- (void)titleChangedTo:(NSString *)title {
	self.book.title = title;
	
	NSUInteger indexes[2];
	indexes[0] = 0;
	indexes[1] = 0;
	
	NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndexes:indexes length:2];
	[self.tableView cellForRowAtIndexPath:indexPath].textLabel.text = title;
}

#pragma mark -
#pragma mark AuthorViewController delegate

- (void)authorChangedTo:(Author *)author {
	self.book.authorId = author.authorId;
	
	NSUInteger indexes[2];
	indexes[0] = 1;
	indexes[1] = 0;
	
	NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndexes:indexes length:2];
	[self.tableView cellForRowAtIndexPath:indexPath].textLabel.text = author.fullName;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.book = nil;
}


- (void)dealloc {
	[book release];
	[backButtonItem release];
	
    [super dealloc];
}


@end

