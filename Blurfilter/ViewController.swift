//
//  ViewController.swift
//  Blurfilter
//
//  Created by Natasha Bhuta on 11/27/18.
//  Copyright © 2018 Columbia SIPA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var twotimes: UIImageView!
    @IBOutlet weak var blur: UIImageView!
    var imageView: UIImageView!
    var context = CIContext(options: nil)
    var currentAnimation = 0
    var currentZoom: CGFloat = 1.0
    var blurRadius = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    };

    @IBAction func twotimes(_ sender: Any) {
        print("doubled")
        currentZoom *= 2
        twotimes.transform = CGAffineTransform(scaleX: currentZoom, y: currentZoom)

    }
    @IBAction func resetZoom(_ sender: Any) {
        currentZoom = 1.0
        twotimes.transform = CGAffineTransform(scaleX: currentZoom, y: currentZoom)
    }
    
    @IBAction func blur(_ sender: Any) {
        print("blurred")
        blurRadius += 10
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: blur.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(blurRadius, forKey: kCIInputRadiusKey)
        
        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
        
        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        blur.image = processedImage
    }
    
}
