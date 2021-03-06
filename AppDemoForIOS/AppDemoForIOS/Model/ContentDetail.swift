//
//  ContentDetail.swift
//  AppDemo
//
//  Created by GuoLiang on 2020/2/13.
//  Copyright © 2020 scan. All rights reserved.
//

import UIKit

class ContentDetail: NSObject {
    var datePublished: String?;
    var smallImage: NSObject?;
    var headline: String?;
    var teaser: String?;
    var teaserHeight: CGFloat = 0.0;
    var author: String?;
    var type: String?;
    var bodySection: [ContentParagraph] = [];
    var path: String?;
    var time: String?;
}
