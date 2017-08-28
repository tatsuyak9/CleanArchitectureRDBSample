//
//  UIImageView+Extension.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setFadeImage(urlString: String,
                      placeholderImage: Image? = nil,
                      progressBlock: DownloadProgressBlock? = nil,
                      completionHandler: CompletionHandler? = nil) {
        
        var url: URL? = nil
        if let downloadUrl = URL(string: urlString) {
            url = downloadUrl
        }
        self.kf.setImage(with: url,
                         placeholder: placeholderImage,
                         options: [.transition(ImageTransition.fade(0.3))],
                         progressBlock: progressBlock,
                         completionHandler: completionHandler)
    }
}
