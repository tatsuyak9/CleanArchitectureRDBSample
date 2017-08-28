//
//  ListModel.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit

public struct ListModel {
    
    public var title: String
    public var image: String
    
    public init(entity: ListEntity) {
        self.title = entity.title
        self.image = entity.image
    }
}
