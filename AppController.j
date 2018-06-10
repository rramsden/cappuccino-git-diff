/*
 * AppController.j
 * CappDiff
 *
 * Created by You on June 10, 2018.
 * Copyright 2018, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

var git = require("./git")

@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet CPTextView  _textView;
    @outlet CPTableView _tableView;

    CPMutableArray _tableDataArray;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    [_textView setString:@"Loading..."]
    _tableDataArray = @[];

    git.listFilesAsync().then(function(fileList) {
        _tableDataArray = fileList
        [_tableView reloadData];

        var indexSet = [CPIndexSet alloc];
        [indexSet addIndex:0];
        [_tableView selectRowIndexes:indexSet byExtendingSelection:NO];
        [self performClick:self]
    })
}

- (CPInteger)numberOfRowsInTableView:(CPTableView)table {
    return [_tableDataArray count];
}

- (@action)performClick:(id)aSender {
    var rowIndex = [_tableView selectedRow]
    var fileName = _tableDataArray[rowIndex]

    if (fileName) {
        git.showDiff(fileName).then(function(diff) {
            [_textView setString:diff]
        })
    }
}

- (id) tableView                :(CPTableView)table 
       objectValueForTableColumn:(CPTableColumn)column 
       row                      :(CPInteger)rowIndex
{
    return [_tableDataArray objectAtIndex:rowIndex];
}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];
}

@end
