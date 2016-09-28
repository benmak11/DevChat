//
//  CameraVC.swift 
//  DevChat
//
//  Created by Baynham Makusha on 9/28/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController {

    @IBOutlet weak var previewView: AAPLPreviewView!
    override func viewDidLoad() {
        
        self._previewView = previewView
        
        super.viewDidLoad()

    }


}

