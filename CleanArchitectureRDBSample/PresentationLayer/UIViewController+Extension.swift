//
//  UIViewController+Extension.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func getHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
}
