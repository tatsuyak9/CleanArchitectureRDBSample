//
//  ListEntity.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import Unbox

public struct ListEntity {
    public var title: String = ""
    public var image: String = ""
}

extension ListEntity: Unboxable {
    public init(unboxer: Unboxer) throws {
        self.title = unboxer.unbox(key: "title") ?? ""
        self.image = unboxer.unbox(key: "image") ?? ""
    }
}
