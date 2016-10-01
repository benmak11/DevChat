//
//  AAPLCameraVCDelegate.h
//  DevChat
//
//  Created by Baynham Makusha on 9/28/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

#ifndef AAPLCameraVCDelegate_h
#define AAPLCameraVCDelegate_h

@protocol AAPLCameraVCDelegate <NSObject>

-(void) shouldEnableRecordUI:(BOOL)enable;
-(void) shouldEnableCameraUI:(BOOL)enable;
-(void) canStartRecording;
-(void) recordingHasStarted;
-(void) videoRecordingComplete:(NSURL*) videoURL;
-(void) videoRecordingFailed;
-(void) snapShotTaken:(NSData*)snapshotData;
-(void) snapShotFailed;

@end


#endif /* AAPLCameraVCDelegate_h */
