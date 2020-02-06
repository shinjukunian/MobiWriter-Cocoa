//
//  MobiWriter.m
//  MobiWriter
//
//  Created by Morten Bertz on 2020/02/06.
//

#import "MobiExporter.h"
#import "MobiPage.h"

#import "_MobiWriter/src/MobiBook.h"
#import "_MobiWriter/src/MobiWriter.h"

@interface MobiExporter ()

@property NSMutableArray <MobiPage*> * pages;

@end

@implementation MobiExporter

-(instancetype)init{
    self=[super init];
    if (self) {
        self.title=@"";
        self.author=@"";
        self.pages=[NSMutableArray new];
    }
    return self;
}

-(void)addPage:(MobiPage *)page{
    [self.pages addObject:page];
}


-(BOOL)writeToURL:(NSURL *)url{
    std::string title = std::string([self.title cStringUsingEncoding:NSUTF8StringEncoding]);
    std::string author = std::string([self.author cStringUsingEncoding:NSUTF8StringEncoding]);

    MobiBook *mobi_book = new MobiBook(title, author);
    for (MobiPage *page in self.pages) {
        mobi_book->addHtmlFile(std::string([page.pageURL fileSystemRepresentation]));
    }
    
    MobiWriter *mobi_writer = new MobiWriter();
    BOOL result=mobi_writer->write(mobi_book, [url fileSystemRepresentation]);
    delete mobi_book;
    delete mobi_writer;
    return result;
}

@end
