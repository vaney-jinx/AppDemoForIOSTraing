//
//  ContentParagraph.swift
//  AppDemoForIOS
//
//  Created by GuoLiang on 2020/2/18.
//  Copyright © 2020 scan. All rights reserved.
//

import UIKit

class ContentParagraph: NSObject {
    init(content: String) {
        self.content = content
        self.contentHeight = 0.0;
    }
    var contentHeight: CGFloat = 0.0;
    var content: String = "";
}
