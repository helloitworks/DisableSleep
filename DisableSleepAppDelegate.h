//
//  DisableSleepAppDelegate.h
//  DisableSleep
//
//  Created by Fraser Hess on 10/12/09.
//  Copyright 2009 Sweeter Rhythm. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface DisableSleepAppDelegate : NSObject {
	IBOutlet NSButton *disableEnableDisplaySleepButton;
	IBOutlet NSButton *disableEnableIdleSleepButton;
	IOPMAssertionID displaySleepAssertionID;
	IOPMAssertionID idleSleepAssertionID;
    NSTimer *_timer;
}

- (IBAction)disableEnableDisplaySleep:(id)sender;
- (IBAction)disableEnableIdleSleep:(id)sender;


@end
