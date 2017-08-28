//
//  ListTranslator.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit

final class ListTranslator: NSObject {

    public static func getThreadModel(listEntity: ListEntity) -> ListModel {
        return ListModel(entity: listEntity)
    }
}
