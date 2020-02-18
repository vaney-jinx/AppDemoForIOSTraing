//
//  ArticleDetailContentCell.swift
//  AppDemoForIOS
//
//  Created by GuoLiang on 2020/2/18.
//  Copyright © 2020 scan. All rights reserved.
//

import UIKit

class ArticleDetailContentCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var bottomLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
