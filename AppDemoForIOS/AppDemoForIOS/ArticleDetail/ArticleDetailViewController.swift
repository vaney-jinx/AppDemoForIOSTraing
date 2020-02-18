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
    @IBOutlet weak var tableView: UITableView!;

    override func viewDidLoad() {
        super.viewDidLoad();
        
        articleDetail.teaserHeight = getNormalStrH(str: articleDetail.teaser!, strFont: CGFloat(17.0), w: tableView.frame.size.width - 40);
//        var screenBounds:CGRect = UIScreen.main.bounds
//        print(screenBounds)
//        print("---")
//        print(tableView.frame.size.width)
        
        for paragph in articleDetail.bodySection {
            paragph.contentHeight = getNormalStrH(str: paragph.content, strFont: CGFloat(17.0), w: tableView.frame.size.width - 40);
        }
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
        return 2 + articleDetail.bodySection.count;
    }
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 400.0;
        } else if (indexPath.row == 1) {
            return (CGFloat(25.0 + articleDetail.teaserHeight));
        } else {
            let paragraph = articleDetail.bodySection[indexPath.row - 2];
            return 20.0 + paragraph.contentHeight;
        }
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            let cell: ArticleDetailContentCell = tableView.dequeueReusableCell(withIdentifier: "ArticleDetailContent", for: indexPath) as! ArticleDetailContentCell;
            cell.contentView.addSubview(cell.bottomLine);
            cell.contentLabel.frame.size.height = articleDetail.teaserHeight;
            cell.contentLabel.text = articleDetail.teaser;
            return cell;
        } else {
            let cell: ArticleDetailContentCell = tableView.dequeueReusableCell(withIdentifier: "ArticleDetailContent", for: indexPath) as! ArticleDetailContentCell;
            if(cell.bottomLine != nil) {
                cell.bottomLine.removeFromSuperview();
            }
            let paragraph = articleDetail.bodySection[indexPath.row - 2];
            cell.contentLabel.frame.size.height = paragraph.contentHeight;
            cell.contentLabel.text = paragraph.content;
            return cell;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0;
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30));
        view.backgroundColor = UIColor(red: (250/255.0), green: (250/255.0), blue: (250/255.0), alpha: 1);
        return view;

    }
    
    private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
        if str != nil {
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
            return strSize
        }
        return CGSize(width: 0, height: 0);
    }

    func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }

}




