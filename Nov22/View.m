//
//  View.m
//  Nov22
//
//  Created by Phillip Gulla on 11/17/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame {

	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor grayColor];
		path = CGPathCreateMutable();  // born empty
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
	
		//Center the button in the view.
		/*
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
		
		button.frame = CGRectMake(
								  b.origin.x + (b.size.width - s.width) / 2,
								  b.origin.y + (b.size.height - s.height) / 2,
								  s.width,
								  s.height
								  );
		 */
		
		
		//Position the button in the view - PG 111712
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
		
		button.frame = CGRectMake(b.origin.x + (b.size.width - s.width) / 2,
								  b.origin.y =410,
								  s.width,
								  s.height
								  );
		
		
		
		[button setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		[button setTitle: @"Erase" forState: UIControlStateNormal];
		
		[button addTarget: [UIApplication sharedApplication].delegate
				   action: @selector(touchUpInside:)
		 forControlEvents: UIControlEventTouchUpInside
		 ];
		
		[self addSubview: button];
		}
	
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathMoveToPoint(path, NULL, p.x, p.y);
}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathAddLineToPoint(path, NULL, p.x, p.y);
	[self setNeedsDisplay]; // Trigger a call to drawRect:.
}


// Function to erase drawing when home button is pressed PG 111712
- (void) clearPath	{
	CGPathRelease (path);
	path = CGPathCreateMutable();
	[self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	CGContextAddPath(c, path);
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);	//black
	CGContextStrokePath(c);
}

@end
