//
//  SegmentedExt.swift
//  Stage2
//
//  Created by dejaWorks on 05/12/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

#if canImport(UIKit)

import UIKit
#if !os(watchOS)
extension UISegmentedControl {
    func goVertical() {
        self.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        for segment in self.subviews {
            for segmentSubview in segment.subviews {
                if segmentSubview is UILabel {
                    (segmentSubview as! UILabel).transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
                }
            }
        }
    }
    func restoreHorizontal() {
        self.transform = CGAffineTransform.identity
        for segment in self.subviews {
            for segmentSubview in segment.subviews {
                if segmentSubview is UILabel {
                    (segmentSubview as! UILabel).transform = CGAffineTransform.identity
                }
            }
        }
    }
}
#endif

#endif

