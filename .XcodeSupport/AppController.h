#import <Cocoa/Cocoa.h>
#import "xcc_general_include.h"

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow* theWindow;
@property (assign) IBOutlet NSTextView* _textView;
@property (assign) IBOutlet NSTableView* _tableView;

- (IBAction)performClick:(id)aSender;

@end
