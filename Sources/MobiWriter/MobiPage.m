//
//  MobiPage.m
//  MobiWriter
//
//  Created by Morten Bertz on 2020/02/06.
//

#import "MobiPage.h"

@interface MobiPage ()
@end

@implementation MobiPage

-(instancetype)initWithHTMLString:(NSString*)HTMLString{
    self=[super init];
    if (self) {
        
    }
}
-(instancetype)initWithHTMLatURL:(NSURL*)url{
    self=[super init];
    if (self) {
        self.pageURL=url;
    }
}


@end
