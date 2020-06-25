//
//  LabelBestFit.swift
//  Stage2
//
//  Created by dejaWorks on 19/04/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit
extension UILabel {
    
    /// Will auto resize the contained text to a font size which fits the frames bounds
    /// Uses the pre-set font to dynamicly determine the proper sizing
    func fitTextToBounds() {
        guard let text = text, let currentFont = font else { return }
        
        if let dynamicFontSize = UIFont.bestFitFontSize(for: text, in: bounds, fontName: currentFont.fontName) {
            font = UIFont(name: currentFont.fontName, size: dynamicFontSize)
        }
    }
    
}
