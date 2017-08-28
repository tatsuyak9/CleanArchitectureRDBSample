//
//  TopViewController.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit
import Firebase
import RxSwift
import RxCocoa

final class TopViewController: UIViewController {

    fileprivate let topPresenterProtocol: TopPresenterProtocol = TopPresenter()
    private let disposeBag: DisposeBag = DisposeBag()

    fileprivate var topCellHeight: CGFloat = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        self.bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Method
    // MARK: Init
    
    /// initialize method
    private func initialize() {
        self.topCellHeight = (self.getHeight() / 3) - 20

        self.setupTableView()
        self.topPresenterProtocol.getLists(completion: {})
    }
    
    private func bind() {
        
        self.topPresenterProtocol.items.asDriver().drive(onNext: { [weak self] _ in
            self?.tableView.reloadData()
        }).addDisposableTo(self.disposeBag)
    }
    
    // MARK: View Control
    // MARK: -setup
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .white
        self.tableView.separatorStyle = .none
        self.tableView.register(cellType: TopCell.self)
    }
}

extension TopViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.topCellHeight
    }
}

extension TopViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.topPresenterProtocol.items.value.count > 0 {
            return self.topPresenterProtocol.items.value.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(type: TopCell.self, for: indexPath)
        
        if self.topPresenterProtocol.items.value.count > 0 {
            cell.setCellData(model: self.topPresenterProtocol.items.value[indexPath.row])
        }
        return cell
    }
}
