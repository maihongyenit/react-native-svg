/**
 * Copyright (c) 2015-present, Horcrux.
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNSVGText.h"
#import "RNSVGBezierPath.h"
#import "RCTConvert+RNSVG.h"
#import <CoreText/CoreText.h>

@implementation RNSVGText

- (void)setTextAnchor:(RNSVGTextAnchor)textAnchor
{
    [self invalidate];
    _textAnchor = textAnchor;
}

//- (void)renderLayerTo:(CGContextRef)context
//{
    //CGFloat shift = [self getShift:context path:nil];
    // Translate path by alignment offset
    //CGContextSaveGState(context);
    //CGContextConcatCTM(context, CGAffineTransformMakeTranslation(-shift, 0));
    //[super renderLayerTo:context];
    //CGContextRestoreGState(context);
//}

//- (CGPathRef)getPath:(CGContextRef)context
//{
//    CGMutablePathRef path = CGPathCreateMutable();
    
//        CGPathRef collection = [self getPathFromSuper:context];
//        
//        // get alignment shift and Translate CGPath by it.
//        CGFloat shift = [self getShift:context path:collection];
//        CGAffineTransform align = CGAffineTransformMakeTranslation(shift, 0);
//        CGPathAddPath(path, &align, collection);
//        CGPathRelease(collection);
    
//    return (CGPathRef)CFAutorelease(path);
//}

- (CGPathRef)getContentPath:(CGContextRef)context
{
    [self setBoundingBox:CGContextGetClipBoundingBox(context)];
    CGMutablePathRef path = CGPathCreateMutable();
    
//    if (![self.content isEqualToString:@""]) {
//        CGFontRef *font = [RCTConvert RNSVGFont:self.font];
//        NSLog(@"font: %@", font);
        // Create a dictionary for this font
//        CFDictionaryRef attributes = (__bridge CFDictionaryRef)@{
//                                                                 (NSString *)kCTFontAttributeName: (__bridge id)self.font,
//                                                                 (NSString *)kCTForegroundColorFromContextAttributeName: @YES
//                                                                 };
//        
//        CFStringRef string = (__bridge CFStringRef)self.content;
//        CFAttributedStringRef attrString = CFAttributedStringCreate(kCFAllocatorDefault, string, attributes);
//        CTLineRef line = CTLineCreateWithAttributedString(attrString);
//        CFRelease(attrString);
//        
//        CGMutablePathRef linePath = [self setLinePath:line];
//        
//        // Set up text frame with font metrics
//        CGFloat size = CTFontGetSize(self.font);
//        CGFloat px = self.px ? [self getWidthRelatedValue:self.px] : 0;
//        CGFloat py = self.py ? [self getHeightRelatedValue:self.py] : 0;
//        
//        if (self.px) {
//            text.offsetX = px;
//        }
//        
//        if (self.py) {
//            text.offsetY = py + size * 1.1;
//        }
//        
//        text.offsetX += self.dx;
//        text.offsetY += self.dy;
//        
//        CGAffineTransform offset = CGAffineTransformMakeTranslation(text.offsetX, text.offsetY);
//        
//        text.offsetX += CTLineGetTypographicBounds(line, nil, nil, nil);
//        
//        CGPathAddPath(path, &offset, linePath);
//        CGPathRelease(linePath);
//    } else {
//        text.offsetX += self.dx;
//        text.offsetY += self.dy;
//    }

    
    return path;
}

- (CGPathRef)getPathFromSuper:(CGContextRef)context
{
    CGPathRef path = [super getPath:context];
    // reset offsetX and offsetY
    self.offsetX = self.offsetY = 0;
    return path;
}

//- (CGFloat)getShift:(CGContextRef)context path:(CGPathRef)path
//{
//    if (!path) {
//        path = [self getPathFromSuper:context];
//    }
//    
//    CGFloat width = CGPathGetBoundingBox(path).size.width;
//    CGFloat shift;
//    switch (self.alignment) {
//        case kCTTextAlignmentRight:
//            shift = width;
//            break;
//        case kCTTextAlignmentCenter:
//            shift = width / 2;
//            break;
//        default:
//            shift = 0;
//            break;
//    }
//    
//    return shift;
//}

@end
