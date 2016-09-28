/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
View controller for camera interface.
*/

@import UIKit;
@class AAPLPreviewView;

#import "AAPLCameraVCDelegate.h"

@interface AAPLCameraViewController : UIViewController

@property (nonatomic, weak) AAPLPreviewView *_previewView;
@property (retain) id <AAPLCameraVCDelegate> delegate;     // forward declared "delegate" to use it in the AAPLCameraViewController.m file

- (void)changeCamera;
- (void)toggleMovieRecording;


@end
