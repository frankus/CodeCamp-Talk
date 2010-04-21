//
//  MobileBooksAppDelegate.m
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MobileBooksAppDelegate.h"
#import "RootViewController.h"
#import "ObjectiveResource.h"
#import "Connection.h"


@implementation MobileBooksAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	[ObjectiveResourceConfig setSite:@"http://localhost:3000/"];
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	
	id foo = [Connection get:@"http://slashdot.org/" withUser:nil andPassword:nil];
	
	NSLog(@"%@", foo);
	
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

