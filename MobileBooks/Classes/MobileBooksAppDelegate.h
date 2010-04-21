//
//  MobileBooksAppDelegate.h
//  MobileBooks
//
//  Created by Code Camp on 4/18/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobileBooksAppDelegate : NSObject <UIApplicationDelegate> {

	
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

