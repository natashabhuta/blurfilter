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
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],
    animations: { [unowned self] in
    switch self.currentAnimation {
    case 0:
    self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
    case 1:
    self.imageView.transform = CGAffineTransform.identity
        default:
            break
        };,
        
        }
    }


}
