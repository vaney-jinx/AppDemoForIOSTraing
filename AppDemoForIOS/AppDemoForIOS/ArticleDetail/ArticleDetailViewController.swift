//
//  ReadDetailViewController.swift
//  AppDemo
//
//  Created by GuoLiang on 2020/1/20.
//  Copyright © 2020 scan. All rights reserved.
//


import UIKit

class ArticleDetailController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var articleDetail: ContentDetail!;
//    @IBOutlet weak var tableView: UITableView!;

    override func viewDidLoad() {
        super.viewDidLoad();
        
    }
    
    func tableView(_ tableView:UITableView, viewForSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }
    
    
    func tableView(_ tableView:UITableView, numberOfSections section: Int) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 400.0;
        } else if (indexPath.row == 1) {
            return 50.0;
        } else {
            return 60.0;
        }
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell1: UITableViewCell;
        if(indexPath.row == 0) {
            let cell: ArticleDetailTitleCell = tableView.dequeueReusableCell(withIdentifier: "ArticleDetailTitle", for: indexPath) as! ArticleDetailTitleCell;
            cell.titleLabel.text = articleDetail.headline;
            cell.typeLabel.text = articleDetail.type;
            cell.timeLabel.text = articleDetail.time;
            cell.timeLabel.textAlignment = NSTextAlignment.right;
            cell.authorLabel.text = articleDetail.author;
            cell.articleImage?.image = UIImage(named: articleDetail.path ?? "chat");
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
            return cell;
        } else if (indexPath.row == 1) {
            cell1 = tableView.dequeueReusableCell(withIdentifier: "ReadListTableCellId", for: indexPath) as! ReadListTableCell;
        } else {
            cell1 = tableView.dequeueReusableCell(withIdentifier: "ReadListTableCellId", for: indexPath) as! ReadListTableCell;
        }
        return cell1;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0;
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30));
        view.backgroundColor = UIColor(red: (250/255.0), green: (250/255.0), blue: (250/255.0), alpha: 1);
        return view;

    }
}




