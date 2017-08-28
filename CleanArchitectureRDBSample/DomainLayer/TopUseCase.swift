//
//  TopUseCase.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit
import Firebase
import Unbox

public protocol TopUseCaseProtocol {
    
    func getLists(completion: @escaping (([ListModel]) -> Void))
}

final class TopUseCase: TopUseCaseProtocol {

    let realtimeDatabaseProtocol: FBRealtimeDatabaseProtocol = FBRealtimeDatabaseClient()

    var listModels: [ListModel] = []

    public func getLists(completion: @escaping (([ListModel]) -> Void)) {

        self.realtimeDatabaseProtocol.getLists(completion: { (snapshot: DataSnapshot) in

            let dictionary: NSDictionary = snapshot.value as! NSDictionary
            
            if self.listModels.count > 0 {
                self.listModels.removeAll()
            }

            for object in snapshot.children {
                let child = object as! DataSnapshot
                do {
                    let entity: ListEntity = try unbox(dictionary: dictionary.object(forKey: child.key) as! UnboxableDictionary)
                    self.listModels.append(ListTranslator.getThreadModel(listEntity: entity))
                    
                } catch _ {
                    self.listModels.append(ListTranslator.getThreadModel(listEntity: ListEntity()))
                }
            }
            completion(self.listModels)
        })
    }
}
