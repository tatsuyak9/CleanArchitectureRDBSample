//
//  TopPresenter.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit
import Firebase
import RxSwift
import RxCocoa

protocol TopPresenterProtocol: PresenterProtocol {
    
    var items: Variable<[ListModel]> { get }
    func getLists(completion: @escaping ((Void) -> Void))
}

final class TopPresenter: TopPresenterProtocol {

    var items: Variable<[ListModel]> = Variable<[ListModel]>([])
    
    let topUseCaseProtocol: TopUseCaseProtocol = TopUseCase()
    
    public func getLists(completion: @escaping ((Void) -> Void)) {
        self.topUseCaseProtocol.getLists(completion: { (models: [ListModel]) in
            self.items.value = models
            completion()
        })
    }
}
