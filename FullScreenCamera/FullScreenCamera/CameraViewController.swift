//
//  ViewController.swift
//  FullScreenCamera
//
//  Created by joonwon lee on 28/04/2019.
//  Copyright © 2019 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class CameraViewController: UIViewController {
    
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var blurBGView: UIVisualEffectView!
    @IBOutlet weak var switchButton: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let avCaptureManager = AVCaptureManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.previewView.session = self.avCaptureManager.captureSession
        self.avCaptureManager.intialSettingAndStart()
        self.setupUI()
    }
    
    func setupUI() {
        photoLibraryButton.layer.cornerRadius = 10
        photoLibraryButton.layer.masksToBounds = true
        photoLibraryButton.layer.borderColor = UIColor.white.cgColor
        photoLibraryButton.layer.borderWidth = 1
        captureButton.layer.cornerRadius = captureButton.bounds.height/2
        captureButton.layer.masksToBounds = true
        blurBGView.layer.cornerRadius = blurBGView.bounds.height/2
        blurBGView.layer.masksToBounds = true
    }
    
    @IBAction func switchCamera(sender: Any) {
        avCaptureManager.switchCamera(sender as! UIButton)
    }
    
    @IBAction func capturePhoto(_ sender: UIButton) {
        // 현재 캡처세션에서 사용하고 있는 회전방향
        guard let orientation = self.previewView.videoPreviewLayer.connection?.videoOrientation else { return }
        avCaptureManager.capturePhoto(orientation)
    }
}
