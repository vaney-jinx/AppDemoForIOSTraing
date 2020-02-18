//
//  ArticleDetailTitleCell.swift
//  AppDemo
//
//  Created by GuoLiang on 2020/2/16.
//  Copyright © 2020 scan. All rights reserved.
//

import UIKit

class ArticleDetailTitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!;
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
