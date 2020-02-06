//
//  MobiPage.m
//  MobiWriter
//
//  Created by Morten Bertz on 2020/02/06.
//

#import "MobiPage.h"

@interface MobiPage ()
@property BOOL cleanupFiles;
@end

@implementation MobiPage

-(nullable instancetype)initWithHTMLString:(NSString*)HTMLString{
    self=[super init];
    if (self) {
        NSURL *temp=[[[NSURL fileURLWithPath:NSTemporaryDirectory()]URLByAppendingPathComponent:[[NSUUID new]UUIDString]]URLByAppendingPathExtension:@"html"];
        BOOL success=[HTMLString writeToURL:temp atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if(success == NO){
            return nil;
        }
        self.pageURL=temp;
        self.cleanupFiles=YES;
    }
    return self;
}

-(instancetype)initWithHTMLatURL:(NSURL*)htmlURL{
    self=[super init];
    if (self) {
        self.pageURL=htmlURL;
    }
    return self;
}


- (void)dealloc{
    if (self.cleanupFiles && [self.pageURL checkResourceIsReachableAndReturnError:nil]) {
        [[NSFileManager defaultManager]removeItemAtURL:self.pageURL error:nil];
    }
}

@end
