//
//  CollectionViewExt.swift
//  Stage2
//
//  Created by dejaWorks on 02/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit

/**
 Scrolls the collection view contents until the specified supplementaryView is visible.
 - parameters:
 - kind: A String constant representing the type of the view, typically `UICollectionElementKindSectionHeader` or `UICollectionElementKindSectionFooter`.
 - indexPath: The index path of the supplementaryView to scroll into view.
 - scrollPosition: An option that specifies where the supplementaryView should be positioned when scrolling finishes. For a list of possible values, see [UICollectionViewScrollPosition](https://developer.apple.com/documentation/uikit/uicollectionviewscrollposition).
 - animated: Specify true to animate the scrolling behavior or false to adjust the scroll view’s visible content immediately.
 */
#if !os(watchOS)
public extension UICollectionView {
    func scrollToSupplementaryView(ofKind kind: String, at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        self.layoutIfNeeded();
        if let layoutAttributes =  self.layoutAttributesForSupplementaryElement(ofKind: kind, at: indexPath) {
            let viewOrigin = CGPoint(x: layoutAttributes.frame.origin.x, y: layoutAttributes.frame.origin.y);
            var resultOffset : CGPoint = self.contentOffset;
            
            switch(scrollPosition) {
            case UICollectionView.ScrollPosition.top:
                resultOffset.y = viewOrigin.y - self.contentInset.top
                
            case UICollectionView.ScrollPosition.left:
                resultOffset.x = viewOrigin.x - self.contentInset.left
                
            case UICollectionView.ScrollPosition.right:
                resultOffset.x = (viewOrigin.x - self.contentInset.left) - (self.frame.size.width - layoutAttributes.frame.size.width)
                
            case UICollectionView.ScrollPosition.bottom:
                resultOffset.y = (viewOrigin.y - self.contentInset.top) - (self.frame.size.height - layoutAttributes.frame.size.height)
                
            case UICollectionView.ScrollPosition.centeredVertically:
                resultOffset.y = (viewOrigin.y - self.contentInset.top) -  (self.frame.size.height / 2 - layoutAttributes.frame.size.height / 2)
                
            case UICollectionView.ScrollPosition.centeredHorizontally:
                resultOffset.x = (viewOrigin.x - self.contentInset.left) -  (self.frame.size.width / 2 - layoutAttributes.frame.size.width / 2)
            default:
                break;
            }
            self.scrollRectToVisible(CGRect(origin: resultOffset, size: self.frame.size), animated: animated)
        }
    }
    /// Scroll to item at indexPath with view size calculation
    func scrollToCellView(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        self.layoutIfNeeded();
        if let layoutAttributes =  self.layoutAttributesForItem(at: indexPath){
            let viewOrigin = CGPoint(x: layoutAttributes.frame.origin.x, y: layoutAttributes.frame.origin.y);
            var resultOffset : CGPoint = self.contentOffset;
            
            switch(scrollPosition) {
            case UICollectionView.ScrollPosition.top:
                resultOffset.y = viewOrigin.y - self.contentInset.top
                
            case UICollectionView.ScrollPosition.left:
                resultOffset.x = viewOrigin.x - self.contentInset.left - layoutAttributes.bounds.width
                
            case UICollectionView.ScrollPosition.right:
                resultOffset.x = (viewOrigin.x - self.contentInset.left) - (self.frame.size.width - layoutAttributes.frame.size.width)
                
            case UICollectionView.ScrollPosition.bottom:
                resultOffset.y = (viewOrigin.y - self.contentInset.top) - (self.frame.size.height - layoutAttributes.frame.size.height)
                
            case UICollectionView.ScrollPosition.centeredVertically:
                resultOffset.y = (viewOrigin.y - self.contentInset.top) -  (self.frame.size.height / 2 - layoutAttributes.frame.size.height / 2)
                
            case UICollectionView.ScrollPosition.centeredHorizontally:
                resultOffset.x = (viewOrigin.x - self.contentInset.left) -  (self.frame.size.width / 2 - layoutAttributes.frame.size.width / 2)
            default:
                break;
            }
            self.scrollRectToVisible(CGRect(origin: resultOffset, size: self.frame.size), animated: animated)
        }
    }
}
#endif
