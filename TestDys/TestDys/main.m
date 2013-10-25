//
//  main.m
//  TestDys
//
//  Created by bitpanda on 13-8-19.
//  Copyright (c) 2013年 bitpanda. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LCAppDelegate.h"

int main(int argc, char *argv[])
{
    setuid(0);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([LCAppDelegate class]));
    }
}
