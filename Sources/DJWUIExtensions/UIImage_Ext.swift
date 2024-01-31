//
//  UIImage_Ext.swift
//  
//
//  Created by dejaWorks on 29/06/2020.
//

#if canImport(UIKit)

import UIKit

public extension UIImage{
    
    /// Change image's tint color.
    func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage {
        
        let drawRect = CGRect(x: 0,y: 0,width: size.width,height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}


#endif
