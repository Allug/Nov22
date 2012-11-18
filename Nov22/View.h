//
//  View.h
//  Nov22
//
//  Created by Phillip Gulla on 11/17/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface View: UIView {
	CGMutablePathRef path;
	UIButton *button;
}

// Function to erase drawing when home button is pressed PG 111712
- (void) clearPath;

@end
