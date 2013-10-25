//
//  LCFirstViewController.m
//  TestDys
//
//  Created by bitpanda on 13-8-19.
//  Copyright (c) 2013年 bitpanda. All rights reserved.
//

#import "LCFirstViewController.h"
#include <dlfcn.h>

#define PRIVATE_PATH  "/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony"

@interface LCFirstViewController ()

@end

@implementation LCFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
//    void* handle = dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", RTLD_NOW);
//    Class c = NSClassFromString(@"TUPhoneLogger");
//    id instance = [[c alloc] init];
//    dlclose(handle);
    
    
//    void* handle = dlopen("/System/Library/PrivateFrameworks/Message.framework/Message", RTLD_NOW);
//    Class c = NSClassFromString(@"Account");
//    NSString *typeString = [c accountTypeString];
//    dlclose(handle);

    NSFileManager *fmgr = [[[NSFileManager alloc] init] autorelease];

    CFUUIDRef uuidObj = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidObj);
    CFRelease(uuidObj);
    
    NSString *appPath = [@"/var/mobile/Applications" stringByAppendingPathComponent:(id)uuid];
    BOOL mkdir = [fmgr createDirectoryAtPath:appPath withIntermediateDirectories:YES attributes:nil error:NULL];
    CFRelease(uuid);

    NSLog(@"%d", mkdir);
    
    UIImage *image = [UIImage imageNamed:@"TdEgTiLOvt.jpg"];
    CGImageRef imageRef = image.CGImage;
    
    NSData *data = [self dataWithCGImage:imageRef];
//    UInt8 * bytes = calloc([data length], sizeof(unsigned char));
    UInt8 * bytes = calloc([data length]/3, sizeof(unsigned char));
    UInt8 * sbytes = calloc([data length]*3/4, sizeof(unsigned char));
    UInt8 * rbytes = [data bytes];
    for (int index=0; index < [data length]/4; index++)
    {
//        int r = rbytes[index*3 + 0] & 1;
//        int g = rbytes[index*3 + 1] & 1;
//        int b = rbytes[index*3 + 2] & 1;
//
//                int v = r << 2 | g<<1 | b;
        
//        bytes[index*4] = 255;
//        bytes[index*4 + 1] = v;
//        bytes[index*4 + 2] = v;
//        bytes[index*4 + 3] = v;
        
//         a = rbytes[index + 4] & 1;
//         r = rbytes[index + 5] & 1;
//         g = rbytes[index + 6] & 1;
//         b = rbytes[index + 7] & 1;
//        
//         v = v << 4 |  a<<3 | r << 2 | g<<1 | b;
        
//        bytes[index] = v;
        sbytes[index*3 + 0] = bytes[index*4 + 1];
        sbytes[index*3 + 1] = bytes[index*4 + 2];
        sbytes[index*3 + 2] = bytes[index*4 + 3];
    }
    
    UIImage *result = [self grayImage:[UIImage imageNamed:@"TdEgTiLOvt.jpg"] data:sbytes];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, 1204, 820)];
    imageview.image = result;
    imageview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageview];
    
    
    UIImageWriteToSavedPhotosAlbum(result, nil, nil, nil);
    
}

- (NSData *)dataWithCGImage:(CGImageRef)image
{
    // Use ARGB ColorSpace
    size_t bytesPerPixel = 3;
    size_t bitsPerComponent = 8;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    
    // Allocate memory for our bitmap context based on above sizes
    UInt8 *pixelData = calloc(width * height * bytesPerPixel, sizeof(unsigned char));
    
    // Create the bitmap context
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 width * bytesPerPixel,
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaFirst);
    
    CGColorSpaceRelease(colorSpace);
    if (!context)
    {
        free(pixelData), pixelData = NULL;
        return nil;
    }
    
    // Render the image into the context (ending up in our buffer)
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
    CGContextRelease(context);
    
    NSData *rawData = [NSData dataWithBytesNoCopy:pixelData
                                           length:(width * height * bytesPerPixel)
                                     freeWhenDone:YES];
    
    return rawData;
}
- (UIImage *)grayImage:(UIImage *)source data:(UInt8 *)pixelData
{
    int width = source.size.width;
    int height = source.size.height;
    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate (pixelData,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  width*3,
                                                  colorSpace,
                                                  (CGBitmapInfo)kCGImageAlphaNone);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), nil);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    
    return grayImage;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
