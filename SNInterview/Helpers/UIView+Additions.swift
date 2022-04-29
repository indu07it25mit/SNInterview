//
//  UIView+Additions.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib() -> UIView {
        let bundle = Bundle(for: self)
        let name = String(describing: self)
        guard let objects = bundle.loadNibNamed(name, owner: self, options: nil) as? [UIView],
            let loadedView = objects.last else {
                fatalError("View doesn't exist")
        }
        
        return loadedView
    }
    
    class func fromNib<T: UIView>() -> T {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: T.self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! T
    }
}

struct Storyboard {
      static let main = "Main"
      static let review = "Review"
}

extension UIStoryboard {
  @nonobjc class var main: UIStoryboard {
    return UIStoryboard(name: Storyboard.main, bundle: nil)
  }
    
  @nonobjc class var review: UIStoryboard {
    return UIStoryboard(name: Storyboard.review, bundle: nil)
  }
}
