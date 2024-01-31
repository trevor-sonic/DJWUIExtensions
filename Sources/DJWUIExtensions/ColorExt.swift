//
//  ColorExt.swift
//  Stage2
//
//  Created by dejaWorks on 13/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//
#if canImport(UIKit)
import UIKit

// MARK: - change hue, saturation,brightness, alpha with chaining
public extension UIColor {

    enum ChangeableAttribute{
        case hue, saturation, brightness, alpha
    }

    func change(_ attr:UIColor.ChangeableAttribute, to:CGFloat) -> UIColor {
        
        switch attr {
        case .hue: return change(hue: to)
        case .saturation: return change(saturation: to)
        case .brightness: return change(brightness: to)
        case .alpha: return change(alpha: to)
        }
        
    }
    private func change(hue to:CGFloat)->UIColor{
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0

        if self.getHue(&currentHue,
                       saturation: &currentSaturation,
                       brightness: &currentBrigthness,
                       alpha: &currentAlpha){
            
            return UIColor(
                hue: to,
                saturation: currentSaturation,
                brightness: currentBrigthness,
                alpha: currentAlpha)
            
        } else {
            return self
        }
    }
    private func change(brightness to:CGFloat)->UIColor{
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0

        if self.getHue(&currentHue,
                       saturation: &currentSaturation,
                       brightness: &currentBrigthness,
                       alpha: &currentAlpha){
            
            return UIColor(
                hue: currentHue,
                saturation: currentSaturation,
                brightness: to,
                alpha: currentAlpha)
            
        } else {
            return self
        }
    }
    private func change(saturation to:CGFloat)->UIColor{
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0

        if self.getHue(&currentHue,
                       saturation: &currentSaturation,
                       brightness: &currentBrigthness,
                       alpha: &currentAlpha){
            
            return UIColor(
                hue:        currentHue,
                saturation: to,
                brightness: currentBrigthness,
                alpha:      currentAlpha)
            
        } else {
            return self
        }
    }
    private func change(alpha to:CGFloat)->UIColor{
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0

        if self.getHue(&currentHue,
                       saturation: &currentSaturation,
                       brightness: &currentBrigthness,
                       alpha: &currentAlpha){
            
            return UIColor(
                hue:        currentHue,
                saturation: currentSaturation,
                brightness: currentBrigthness,
                alpha:      to)
            
        } else {
            return self
        }
    }
    
}
/// Reproduce lighter/darker color from given color
public extension UIColor {
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}


public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    convenience init(argb: UInt32) {
        self.init(
            red: Int((argb >> 16) & 0xFF),
            green: Int((argb >> 8) & 0xFF),
            blue: Int(argb & 0xFF),
            a: Int((argb >> 24) & 0xFF)
        )
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
public extension UIColor {

    struct FlatColor {
        public struct Green {
            public static let Fern = UIColor(netHex: 0x6ABB72)
            public static let MountainMeadow = UIColor(netHex: 0x3ABB9D)
            public static let ChateauGreen = UIColor(netHex: 0x4DA664)
            public static let PersianGreen = UIColor(netHex: 0x2CA786)
        }
        
        public struct Blue {
            public static let PictonBlue = UIColor(netHex: 0x5CADCF)
            public static let Mariner = UIColor(netHex: 0x3585C5)
            public static let CuriousBlue = UIColor(netHex: 0x4590B6)
            public static let Denim = UIColor(netHex: 0x2F6CAD)
            public static let Chambray = UIColor(netHex: 0x485675)
            public static let BlueWhale = UIColor(netHex: 0x29334D)
        }
        
        public struct Violet {
            public static let Wisteria = UIColor(netHex: 0x9069B5)
            public static let BlueGem = UIColor(netHex: 0x533D7F)
        }
        
        public struct Yellow {
            public static let Energy = UIColor(netHex: 0xF2D46F)
            public static let Turbo = UIColor(netHex: 0xF7C23E)
        }
        
        public struct Orange {
            public static let NeonCarrot = UIColor(netHex: 0xF79E3D)
            public static let Sun = UIColor(netHex: 0xEE7841)
        }
        
        public struct Red {
            public static let TerraCotta = UIColor(netHex: 0xE66B5B)
            public static let Valencia = UIColor(netHex: 0xCC4846)
            public static let Cinnabar = UIColor(netHex: 0xDC5047)
            public static let WellRead = UIColor(netHex: 0xB33234)
        }
        
        public struct Gray {
            public static let AlmondFrost = UIColor(netHex: 0xA28F85)
            public static let WhiteSmoke = UIColor(netHex: 0xEFEFEF)
            public static let Iron = UIColor(netHex: 0xD1D5D8)
            public static let IronGray = UIColor(netHex: 0x75706B)
        }
    }
}

#endif
