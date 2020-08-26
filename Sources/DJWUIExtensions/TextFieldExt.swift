//
//  TextFieldExt.swift
//  Stage2
//
//  Created by dejaWorks on 13/01/2019.
//  Copyright © 2019 dejaWorks. All rights reserved.
//

import UIKit

public extension UITextField {
  

    public func addDoneToolbar(onDone: (target: Any, action: Selector)? = nil) {
        
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        toolbar.isTranslucent = false
        self.inputAccessoryView = toolbar
        
    }
    
    
//    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
//        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
//        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
//
//        let toolbar: UIToolbar = UIToolbar()
//        toolbar.barStyle = .default
//        toolbar.items = [
//            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
//            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
//            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
//        ]
//        toolbar.sizeToFit()
//
//        self.inputAccessoryView = toolbar
//    }
    
    // Default actions:
    @objc func doneButtonTapped() {
        
        self.resignFirstResponder()
        
        
    }
    //func cancelButtonTapped() { self.resignFirstResponder() }
}
