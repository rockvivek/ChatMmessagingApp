//
//  Extensions.swift
//  ChatMessangerApp
//
//  Created by Vivek Shrivastava on 30/12/23.
//

import Foundation
import UIKit

extension UIView {
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return left + width
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return top + height
    }
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
}
