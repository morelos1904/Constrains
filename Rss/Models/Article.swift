//
//  Article.swift
//  Rss
//
//  Created by MCS on 3/30/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import Foundation

class Article{
    
    var title: String = ""
    var img: String = ""
    var text: String = ""
    var url: String = ""

    
    init() {
        
    }
    
    init(titleNews title:String,imageNew image:String,description desc:String,webSite url:String){
        self.title = title
        self.img = image
        self.text = desc
        self.url = url

    }

}
