//
//  DisableSleepAppDelegate.m
//  DisableSleep
//
//  Created by Fraser Hess on 10/12/09.
//  Copyright 2009 Sweeter Rhythm. All rights reserved.
//

#import "DisableSleepAppDelegate.h"
#import "NSDate+Extension.h"
#import "SYXLogger.h"

@implementation DisableSleepAppDelegate

- (void)awakeFromNib
{
    [[SYXLogger sharedInstance] setFilePathName:@"/tmp/DisableSleep.log"];
    LOG_DEBUG(@"it is a test");
    [self startTimer];
}

- (IBAction)disableEnableDisplaySleep:(id)sender {
	if (!displaySleepAssertionID) {
		[disableEnableDisplaySleepButton setTitle:@"Enable display sleep"];
		[disableEnableIdleSleepButton setEnabled:NO];
		IOPMAssertionCreate(kIOPMAssertionTypeNoDisplaySleep, kIOPMAssertionLevelOn, &displaySleepAssertionID);
	} else {
		[disableEnableDisplaySleepButton setTitle:@"Disable display sleep"];
		[disableEnableIdleSleepButton setEnabled:YES];
		IOPMAssertionRelease(displaySleepAssertionID);
		displaySleepAssertionID = 0;
	}
}

- (IBAction)disableEnableIdleSleep:(id)sender {
	if (!idleSleepAssertionID) {
		[disableEnableIdleSleepButton setTitle:@"Enable idle sleep"];
		[disableEnableDisplaySleepButton setEnabled:NO];
		IOPMAssertionCreate(kIOPMAssertionTypeNoIdleSleep, kIOPMAssertionLevelOn, &idleSleepAssertionID);
	} else {
		[disableEnableIdleSleepButton setTitle:@"Disable idle sleep"];
		[disableEnableDisplaySleepButton setEnabled:YES];
		IOPMAssertionRelease(idleSleepAssertionID);
		idleSleepAssertionID = 0;
	}
}



- (void) startTimer {
    if (_timer == nil)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(timerFired)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)stopTimer {
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
    
}


- (void)timerFired {
    LOG_DEBUG(@"timerFired!");
}

@end
