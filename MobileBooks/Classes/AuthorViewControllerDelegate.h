/*
 *  AuthorViewControllerDelegate.h
 *  MobileBooks
 *
 *  Created by Frank Schmitt on 2010-04-14.
 *  Copyright 2010 Laika Systems. All rights reserved.
 *
 */

@class Author;

@protocol AuthorViewControllerDelegate

- (void)authorChangedTo:(Author *)author;

@end

