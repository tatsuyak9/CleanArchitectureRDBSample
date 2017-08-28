//
//  BaseTableViewCell.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
        self.updateFrame()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateFrame()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepareForReuseProcess()
    }
    
    func prepareForReuseProcess() {
        
    }
    
    func initialize() {
        
    }
    
    func updateFrame() {
        
    }
}
