//
//  TopCell.swift
//  CleanArchitectureRDBSample
//
//  Created by 菊池達也 on 2017/08/28.
//  Copyright © 2017年 菊池達也. All rights reserved.
//

import UIKit

final class TopCell: BaseTableViewCell {

    @IBOutlet weak var contentsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Public Methods
    
    func setCellData(model: ListModel) {
        self.contentsImageView.setFadeImage(urlString: model.image)
        self.titleLabel.text = model.title
    }
}
