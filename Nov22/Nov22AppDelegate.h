//
//  Nov22AppDelegate.h
//  Nov22
//
//  Created by Phillip Gulla on 11/17/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
@class View;

@interface Nov22AppDelegate : UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

- (void) touchUpInside: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
