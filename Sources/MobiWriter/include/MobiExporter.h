//
//  MobiWriter.h
//  MobiWriter
//
//  Created by Morten Bertz on 2020/02/06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MobiPage;
@interface MobiExporter : NSObject

@property NSString *title;
@property NSString *author;

-(void)addPage:(nonnull MobiPage*)page;
-(BOOL)writeToURL:(nonnull NSURL*)url;


@end

NS_ASSUME_NONNULL_END
