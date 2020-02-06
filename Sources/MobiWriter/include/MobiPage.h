//
//  MobiPage.h
//  MobiWriter
//
//  Created by Morten Bertz on 2020/02/06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MobiPage : NSObject

@property (nonnull) NSURL *pageURL;

-(instancetype)initWithHTMLString:(NSString*)HTMLString;
-(instancetype)initWithHTMLatURL:(NSURL*)url;

@end

NS_ASSUME_NONNULL_END
