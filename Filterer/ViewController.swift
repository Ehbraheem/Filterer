//
//  ViewController.swift
//  Filterer
//
//  Created by Ehbraheem on 03/04/2017.
//  Copyright © 2017 Ehbraheem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filteredImage: UIImage?
    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageToggle: UIButton!
    
    
    @IBAction func onImageToggle(_ sender: UIButton) {
        if (imageToggle.isSelected) {
            imageView.image = image
            imageToggle.isSelected = false
        } else {
            imageView.image = filteredImage
            imageToggle.isSelected = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        image = #imageLiteral(resourceName: "scenery")
        
        var rgbaImage = RGBAImage(image: image!)!

        let avgRed = 107
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                
                var modifier = 1 + 4 * (Double(y) / Double (rgbaImage.height))
                if (Int(pixel.red) < avgRed) {
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier * Double(redDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        
        filteredImage = rgbaImage.toUIImage()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

