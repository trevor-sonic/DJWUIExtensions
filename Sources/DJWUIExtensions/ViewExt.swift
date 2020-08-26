//
//  ViewExt.swift
//  Stage2
//
//  Created by dejaWorks on 16/07/2019.
//  Copyright © 2019 dejaWorks. All rights reserved.
//

import UIKit

public extension UIView {
    
    func takeScreenshot(afterScreenUpdates: Bool = true) -> UIImage {
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image{
            return image
        }
        return UIImage()
    }
}
public extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
