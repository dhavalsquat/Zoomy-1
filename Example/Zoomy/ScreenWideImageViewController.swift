//
//  ViewController.swift
//  Zoomy
//
//  Created by Menno Lovink on 04/09/2018.
//  Copyright (c) 2018 Menno Lovink. All rights reserved.
//

import UIKit
import Zoomy

class ScreenWideImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addZoombehavior(for: imageView)
        
        setupNavigationBarTogglingBehavior()
    }
}

//MARK: - ZoomDelegate
extension ScreenWideImageViewController: ZoomDelegate {
    
    func didBeginPresentingOverlay(for imageView: UIImageView) {
        print("did begin presenting overlay for imageView: \(imageView)")
    }
    
    func didEndPresentingOverlay(for imageView: UIImageView) {
        print("did end presenting overlay for imageView: \(imageView)")
    }
    
    func contentStateDidChange(from fromState: ImageZoomControllerContentState, to toState: ImageZoomControllerContentState) {
        print("contentState did change from state: \(fromState) to state: \(toState)")
    }
}

// MARK: - Toggling the navigation bar
extension ScreenWideImageViewController {
    
    func setupNavigationBarTogglingBehavior() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackground(with:))))
    }
    
    @objc func didTapBackground(with recognizer: UITapGestureRecognizer) {
        guard let navigationController = navigationController else { return }
        
        if navigationController.isNavigationBarHidden {
            navigationController.setNavigationBarHidden(false, animated: true)
        } else {
            navigationController.setNavigationBarHidden(true, animated: true)
        }
    }
}