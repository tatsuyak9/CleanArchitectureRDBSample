//
//  FBRealtimeDatabaseClient.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit
import Firebase

public protocol FBRealtimeDatabaseProtocol {
    
    func getLists(completion: @escaping ((DataSnapshot) -> Void))
}

final class FBRealtimeDatabaseClient: FBRealtimeDatabaseProtocol {
    
    let rootReference = Database.database().reference()

    func getLists(completion: @escaping ((DataSnapshot) -> Void)) {
        self.rootReference.child("lists").observe(.value) { (snapshot: DataSnapshot) in
            completion(snapshot)
        }
    }
}
