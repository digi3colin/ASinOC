//
//  asinocAppDelegate.m
//  asinoc
//
//  Created by Colin Leung on 20/05/2010.
//  Copyright Digi3 Studio 2010. All rights reserved.
//

#import "asinocAppDelegate.h"

#import "ASMacro.h"
#import "Array.h"
#import "Event.h"
#import "EventDispatcher.h"

@interface ClassB : NSObject{}
-(void)print:(Event*)e;
-(void)dance:(Event*)e;
@end

@implementation ClassB
-(void)print:(Event*)e{
	NSLog(@"print B");
	NSLog(@"%@",[e toString]);
}
-(void)dance:(Event*)e{
	NSLog(@"nice dance!");
}
@end

@interface Item : NSObject
@end

@implementation Item
@end

@interface asinocAppDelegate()
	EventDispatcher* a;
	Event* e;
@end

@implementation asinocAppDelegate

@synthesize window;

- (void)onEvent:(Event*)_event {
	[a removeEventListener:@"EnterFrame" listener:as3delegate(self,onEvent:)];
	NSLog(@"after event a %i", [a retainCount]);
	NSLog(@"after event e %i", [e retainCount]);
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	a = [[EventDispatcher alloc] init];
	
	e = as3newEvent("EnterFrame");
	
	ClassB* b = as3new(ClassB);
	
	ASFunction* f1 = as3delegate(b,print:);
	ASFunction* f2 = as3delegate(b,dance:);
	
	NSLog(@"a %i", [a retainCount]);
	NSLog(@"e %i", [e retainCount]);
	[a addEventListener:@"Change" listener:f1];
	[a addEventListener:@"EnterFrame" listener:f2];
	[a addEventListener:@"EnterFrame" listener:as3delegate(self,onEvent:)];
	[a dispatchEvent:e];
	[a dispatchEvent:e];
	
	NSLog(@"before event a %i", [a retainCount]);
	NSLog(@"before event e %i", [e retainCount]);
	
	[a release];
	
	Array *aa = as3new(Array);
	Item *item = as3new(Item);
	Item *item2= as3new(Item);
	Item *item3= as3new(Item);
	Item *item4= as3new(Item);
	
	NSLog(@"item  %@",item);
	NSLog(@"item2 %@",item2);
	
	NSLog(@"indexOf item  %i", [aa indexOf:item]);
	
	[aa push:item];
	[aa push:item2];
	[aa push:item3];
	[aa push:item4];
	
	NSLog(@"array length  %i",[aa length]);
	NSLog(@"indexOf item  %i", [aa indexOf:item]);
	NSLog(@"indexOf item2 %i", [aa indexOf:item2]);
	
	NSLog(@"join: %@", [aa join]);
	
	NSLog(@"lastIndexOf item  %i", [aa lastIndexOf:item]);
	NSLog(@"lastIndexOf item2 %i", [aa lastIndexOf:item2]);
	
	NSLog(@"%@",[aa join]);
	[aa reverse];
	NSLog(@"%@",[aa join]);
	
	NSLog(@"shift %@", [aa shift]);
	NSLog(@"%@", [aa toString]);
	
	NSLog(@"slice %@", aa);
	Array *bb = [aa slice:0 endIndex:5];
	NSLog(@"slice %@", bb);
	NSLog(@"array b %@", [bb join]);
	
	NSLog(@"pop %@",[aa pop]);
	NSLog(@"pop %@",[aa pop]);
	NSLog(@"pop %@",[aa pop]);
	
	NSLog(@"%i",[aa length]);
	
	Array *cc = as3new(Array);
	
	[cc push:@"Bill"];
	[cc push:@"Jeff"];
	
	NSLog(@"names: %@",[cc join]); // Bill,Jeff
	
	[cc unshift:@"Alfred"];
	[cc unshift:@"Kyle"];
	
	NSLog(@"names: %@",[cc join]); // Kyle,Alfred,Bill,Jeff
	
	[aa release];
	[cc release];
	[item release];
	[item2 release];
	[item3 release];
	[item4 release];

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
