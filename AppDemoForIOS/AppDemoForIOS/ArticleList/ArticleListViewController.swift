//
//  ArticleListViewController.swift
//  AppDemo
//
//  Created by GuoLiang on 2020/1/21.
//  Copyright © 2020 scan. All rights reserved.
//

import UIKit

class ArticleListViewController: UITableViewController {

    var articleList: [Article] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        articleList = getArticleList();
        self.tableView.reloadData();
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articleList.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ReadListTableCell = tableView.dequeueReusableCell(withIdentifier: "ReadListTableCellId", for: indexPath) as! ReadListTableCell;
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20,bottom: 0, right: 20);
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: 40,bottom: 0, right: 40);
        
        let currentArticle = articleList[indexPath.row];
        
        cell.timeLabel.text = currentArticle.readTime;
        cell.typeLabel.text = currentArticle.type;
        cell.titleLabel.text = currentArticle.title;
        cell.articleImage?.image = UIImage(named: currentArticle.path ?? "chat");
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticleDetailId"{
        let detail:ArticleDetailController = segue.destination as! ArticleDetailController
            let curArticle = articleList[tableView.indexPathForSelectedRow!.row];
            detail.articleDetail = curArticle.contenDetail;
        }
    }
    
    func getArticleList() -> [Article] {
        var articles: [Article] = [];
        let path = Bundle.main.path(forResource: "ArticleList", ofType: "json")
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
            do{
                if let jsonObj:NSDictionary = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions()) as? NSDictionary{
                    if let menuItems:NSArray = jsonObj["data"] as? NSArray{
                        for item in menuItems{
                            let articleItem = item as! NSDictionary;
                            let article = Article();
                            article.title = articleItem["title"] as? String;
                            article.type = articleItem["type"] as? String;
                            article.path = articleItem["path"] as? String;
                            let dateInt = articleItem["activationDate"] as! Double;
                            let currentDate =  NSDate.init(timeIntervalSince1970:dateInt/1000.0);
                            let formatter = DateFormatter();
                            formatter.dateFormat = "yyyy-MM-dd HH:mm";
                            let dateStr = formatter.string(from: currentDate as Date);
                            article.readTime = dateStr;
                            
                            let detailItem = articleItem["contentDetail"] as! NSDictionary;
                            let newDetail = ContentDetail();
                            newDetail.author = detailItem["author"] as? String;
                            guard let bodySection = detailItem["bodySection"] as? [String] else { return [] };
                            var newBodySections: [ContentParagraph] = [];
                            for innerItem in bodySection {
                                let newObj = ContentParagraph.init(content: innerItem);
                                newBodySections.append(newObj);
                            }
                            newDetail.bodySection = newBodySections;
                            newDetail.datePublished = detailItem["datePublished"] as? String;
                            newDetail.headline = detailItem["headline"] as? String;
                            newDetail.teaser = detailItem["teaser"] as? String;
                            newDetail.type = article.type;
                            newDetail.path = article.path;
                            newDetail.time = article.readTime;
                            article.contenDetail = newDetail;
                            articles.append(article);
                        }
                        return articles;
                    }
                }
            } catch{
                    print("Error.")
            }
        }
        return articles;
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
