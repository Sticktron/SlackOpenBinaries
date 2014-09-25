//
//  SlackOpenBinaries.x
//  SlackOpenBinaries
//
//  Created by Sticktron on 08.09.2014.
//  Copyright (c) 2014 Sticktron. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <substrate.h>


@interface File
- (BOOL)isDoc;
- (id)filetype;
@end


%group main

%hook File
- (BOOL)isDoc {
	BOOL result = %orig;
	if (!result) {
		NSString *filetype = [self filetype];
		//NSLog(@"*** Slack says filetype is: %@", filetype);
		
		if ([filetype isEqualToString:@"binary"]) {
			result = YES; // treat binaries as "Docs" ;)
		}
	}
	return result;
}
%end

%end


%ctor {
	@autoreleasepool {
		NSLog(@" SlackOpenBinaries loaded.");
		%init(main);
	}
}
