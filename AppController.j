/*
 * AppController.j
 * CPViewExample
 *
 * Created by Szabolcs Toth on February 19, 2012.
 * Copyright 2012, purzelbaum.hu All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];
        [contentView setBackgroundColor:[CPColor colorWithHexString:@"432918"]]

    // split the view into left and right
    verticalSplitter = [[CPSplitView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([contentView bounds]), CGRectGetHeight([contentView bounds]))];
    [verticalSplitter setDelegate: self];
    [verticalSplitter setVertical: YES];
    [verticalSplitter setAutoresizingMask: CPViewWidthSizable | CPViewHeightSizable];
    [verticalSplitter setIsPaneSplitter: NO];

    // create left/right views
    leftView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, 200, CGRectGetHeight([verticalSplitter bounds]))];
    [leftView setBackgroundColor:[CPColor colorWithHexString:@"CA9E67"]]

    rightView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([verticalSplitter bounds])-200, CGRectGetHeight([verticalSplitter bounds]))];
    [rightView setBackgroundColor:[CPColor colorWithHexString:@"432900"]]
    [rightView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

    // split the right view into up and botton
    horizontalSplitter = [[CPSplitView alloc] initWithFrame:CGRectMake(0, (CGRectGetHeight([rightView bounds])/2), CGRectGetWidth([rightView bounds]), CGRectGetHeight([rightView bounds])/2)];
    [horizontalSplitter setDelegate: self];
    [horizontalSplitter setVertical: NO];
    [horizontalSplitter setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [horizontalSplitter setIsPaneSplitter: NO];

    // create botton view
    bottonView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([horizontalSplitter bounds]), CGRectGetHeight([horizontalSplitter bounds]))];
    [bottonView setBackgroundColor:[CPColor colorWithHexString:@"7D4E24"]];
    [bottonView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

    // add views to the contentView
    [horizontalSplitter addSubview: bottonView];
    [rightView addSubview: horizontalSplitter];
    [verticalSplitter addSubview: leftView];
    [verticalSplitter addSubview: rightView];
    [contentView addSubview: verticalSplitter];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

@end
